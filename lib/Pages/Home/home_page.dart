import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart'; // Animation package
import 'package:shared_preferences/shared_preferences.dart'; // For storing city preference
import 'package:weather_app/Pages/Home/Widgets/loading_screen.dart'; // Loading screen widget
import 'package:weather_app/Pages/Home/Widgets/main_temp_display.dart'; // Widget for displaying main temperature
import 'package:weather_app/Pages/Home/Widgets/other_info_card.dart'; // Widget for displaying additional weather info
import 'package:weather_app/Utils/others.dart'; // Utility functions
import 'package:weather_app/Utils/themes.dart'; // Custom app themes

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String city; // Variable to store current city
  Future<void> _refresh() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {});
  }

  Future<void> setSavedCity(String newCity) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("lastCity",
        newCity); // Saving the last searched city to SharedPreferences
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.backgroundColor,
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen(); // Display loading screen while fetching data
            } else if (snapshot.hasData) {
              return RefreshIndicator(
                onRefresh: _refresh,
                child: FadeInUpBig(
                  duration: const Duration(milliseconds: 500),
                  from: 100,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        MainTempDisplay(
                            weather:
                                snapshot.data!), // Display main temperature
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SearchBar(
                            onSubmitted: (value) {
                              setState(() {
                                setSavedCity(
                                    value); // Save new city when submitted
                              });
                            },
                            hintText: 'Search City here',
                            textStyle: const WidgetStatePropertyAll(
                              TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              CustomTheme.primaryColor.withOpacity(.1),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                  color: CustomTheme.secondaryColor,
                                  width: 5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Currently showing ${snapshot.data!['name']} with ${snapshot.data!['weather'][0]['main']}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MoreInfos(
                          weather:
                              snapshot.data!, // Display additional weather info
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: _refresh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 80,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Error fetching data please search another city",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchBar(
                      onSubmitted: (value) {
                        setState(() {
                          setSavedCity(value); // Save new city when submitted
                        });
                      },
                      hintText: 'Search City here',
                      textStyle: const WidgetStatePropertyAll(
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        CustomTheme.primaryColor.withOpacity(.1),
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                            color: CustomTheme.secondaryColor,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}

class MoreInfos extends StatelessWidget {
  const MoreInfos({
    super.key,
    required this.weather,
  });
  final Map<String, dynamic> weather;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OtherInfoCard(
            icon: Icons.wind_power,
            title: "Wind",
            value:
                '${weather['wind']['speed'].toString()} m/s', // Adding 'm/s' for meters per second
          ),
          const SizedBox(
            width: 10,
          ),
          OtherInfoCard(
            icon: Icons.thermostat,
            title: "Pressure",
            value:
                '${weather['main']['pressure'].toString()} hPa', // Adding 'hPa' for hectopascals
          ),
          const SizedBox(
            width: 10,
          ),
          OtherInfoCard(
            icon: Icons.water_drop_rounded,
            title: "Humidity",
            value:
                '${weather['main']['humidity'].toString()}%', // Adding '%' for percentage
          ),
        ],
      ),
    );
  }
}
