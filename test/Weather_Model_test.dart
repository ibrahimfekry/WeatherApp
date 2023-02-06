class WeatherModelTest {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModelTest({
    required this.date, required this.temp, required this.maxTemp,
    required this.minTemp, required this.weatherStateName
  });

  factory WeatherModelTest.fromJson(dynamic data)
  {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModelTest(
      date: data ['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['avgtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
    );
  }

 @override
  String toString()
 {
   return 'temp = $temp';
 }

}