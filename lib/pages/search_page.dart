import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,),
          child: TextField(
            onChanged: (data)
            {
              cityName = data;
            },
            onSubmitted: (data)async{
              cityName = data;

              WeatherService service = WeatherService();
              WeatherModel? weather = await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather ;
              Provider.of<WeatherProvider>(context,listen: false).cityName =cityName;

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
                onPressed: ()async{
                  WeatherService service = WeatherService();
                  WeatherModel? weather = await service.getWeather(cityName: cityName!);

                  Provider.of<WeatherProvider>(context,listen: false).weatherData = weather ;
                  Provider.of<WeatherProvider>(context,listen: false).cityName =cityName;

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

