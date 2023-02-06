import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import '../main.dart';

class WeatherProvider extends ChangeNotifier
{
  String? cityName;
  WeatherModel? _weatherData;
  WeatherModel? weatherDataTest;
  set weatherData (WeatherModel? weatherModel)
  {
    _weatherData = weatherModel;
    notifyListeners();
  }
  WeatherModel? get weatherData => _weatherData;



}