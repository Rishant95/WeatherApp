import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//The main function which gets the data from http request and return in a map of string,dynamic after json decoding
Future<Map<String, dynamic>> getData() async {
  String? city = await getSavedCity();
  const apiKey = "0d4327c746cf1fd20b522e3dc2dc2979";
  final url =
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);

    return json;
  } else {
    return throw Exception("Failed to get weather forcast ${response.body}");
  }
}

//This get ths last stored city value if none returns delhi
Future<String?> getSavedCity() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getString('lastCity') == null) {
    await prefs.setString("lastCity", "delhi");
    return "delhi";
  } else {
    return prefs.getString('lastCity');
  }
}

//This function get images according to the weather string and these image are ai generated
AssetImage getWeatherImage(String weather) {
  debugPrint(weather);
  switch (weather) {
    case "Mist":
      return const AssetImage("assets/img/mist_weather.jpg");
    case "Thunderstorm":
      return const AssetImage("assets/img/thunderstorm.jpg");
    case "Drizzle":
      return const AssetImage("assets/img/drizzle.jpg");
    case "Rain":
      return const AssetImage("assets/img/rain.jpg");
    case "Snow":
      return const AssetImage("assets/img/snow.jpg");
    case "Smoke":
      return const AssetImage("assets/img/smoke.jpg");
    case "Haze":
      return const AssetImage("assets/img/haze.jpg");
    case "Dust":
      return const AssetImage("assets/img/dust.jpg");
    case "Fog":
      return const AssetImage("assets/img/fog.jpg");
    case "Sand":
      return const AssetImage("assets/img/sand.jpg");
    case "Ash":
      return const AssetImage("assets/img/ash.jpg");
    case "Squall":
      return const AssetImage("assets/img/squall.jpg");
    case "Tornado":
      return const AssetImage("assets/img/tornado.jpg");
    case "Clear":
      return const AssetImage("assets/img/clear_sky.jpg");
    case "Clouds":
      return const AssetImage("assets/img/clouds.jpg");
    default:
      return const AssetImage("assets/img/clear_sky.jpg");
  }
}
