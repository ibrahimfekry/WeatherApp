import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:provider/provider.dart';

import 'Weather_Model_test.dart';
import 'weather_service_test.dart';

class SearchPageTest extends StatelessWidget {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,),
          child: TextField(
            onSubmitted: (data)async{
              cityName = data;
              WeatherServiceTest weatherServiceTest = WeatherServiceTest();
              WeatherModelTest weatherModelTest = await weatherServiceTest.getWeatherTest(cityName: cityName!);
              Provider.of<WeatherProvider>(context).weatherData = weatherModelTest as WeatherModel?;

              Navigator.pop(context);

            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.search),
              ),
              labelText: 'Search',
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}

