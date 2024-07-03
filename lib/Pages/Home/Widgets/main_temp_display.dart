import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Utils/others.dart';

class MainTempDisplay extends StatelessWidget {
  const MainTempDisplay({
    super.key,
    required this.weather,
  });

  final Map<String, dynamic> weather; // Weather data received as input

  @override
  Widget build(BuildContext context) {
    // Get weather image based on the main weather condition
    AssetImage weatherImage = getWeatherImage(
      weather['weather'][0]['main'].toString(),
    );

    // Get current date and format it
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMMM y')
        .format(now)
        .toUpperCase(); // Format: Day Month Year
    String formattedDay =
        DateFormat('EEEE').format(now); // Format: Day of the week

    return Container(
      height: 500,
      decoration: BoxDecoration(
        // Background image with overlay color filter
        image: DecorationImage(
          image: weatherImage,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(.15), // Overlay color
            BlendMode.multiply,
          ),
        ),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Row with formatted date and day of the week
              Row(
                children: [
                  Text(
                    "$formattedDate , ",
                    style: const TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    formattedDay,
                    style: const TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              // Temperature display aligned to the right
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Current temperature with large font size
                    Text(
                      "${weather['main']['temp'].toStringAsFixed(0)}°C",
                      style: const TextStyle(
                        fontSize: 85,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: .8,
                      ),
                    ),
                    // "Real feel" temperature
                    Text(
                      "Real feel ${weather['main']['feels_like'].toStringAsFixed(0)}°C", //To show only numbers in int form not in float pointers
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(), // Spacer to push button to the bottom
              // Button for getting more information
              TextButton(
                onPressed: () {
                  // Add functionality here
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Get more Info",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_outward_sharp,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
