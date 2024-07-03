/*--------------------------------------------------------
|                     Weather app                        |
----------------------------------------------------------

Project Title: [Weather app (Openweather api)]

Details:
- Intern Name: Rishant Saini
- Project Period: [02 / 07/ 2024] to [03 / 07/ 2024]

Project Overview:
- Project Objectives: [To fetch weather information for openweather Api and display it]
- Key Features: Current Weather Display , Search Functionality, Weather Data Refresh, Weather Details Cards, Loading Animation, Persistent City Storage
- Technologies Used: [Flutter , OpenWeatherApi, Plugins => http ,shared_preferences , shimmer,animate_do] */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/Pages/Home/home_page.dart';

void main() {
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarIconBrightness: Brightness.dark, // Dark icons for status bar
    ),
  );

  // Set system UI mode manually with only bottom overlays
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);

  // Run the main app
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      home: HomePage(), // Set HomePage as the initial route
    );
  }
}
