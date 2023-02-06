import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Weather_Model_test.dart';

class WeatherServiceTest
{
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '7e1690f3a76b4085930183133221012';
  Future<WeatherModelTest>getWeatherTest({required String cityName})async
  {
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String , dynamic>data = jsonDecode(response.body);
    WeatherModelTest weatherModelTest = WeatherModelTest.fromJson(data);
    return weatherModelTest;

  }
}