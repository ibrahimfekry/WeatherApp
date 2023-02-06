import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import '../providers/weather_provider.dart';


class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
bool iconBool = false;
bool iconTheme = false;
IconData iconLight =Icons.wb_sunny;
IconData iconDark = Icons.nights_stay;

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.light,
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);
class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
  weatherData = Provider.of<WeatherProvider>(context).weatherData ;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:iconBool ?darkTheme  :lightTheme ,
      home: Scaffold(
         appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (){
                  Provider.of<WeatherProvider>(context,listen: false).weatherData?.changeAppMode();
                  setState(() {
                    iconBool = !iconBool;
                  });
                },
                icon:  Icon(iconBool ? iconDark : iconLight),
            ),
            IconButton(onPressed: ()
            {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return SearchPage(

                    );
                  },),
              );
            }, icon: const Icon(Icons.search),),

          ],
          title:const Text('Weather App'),
        ),
        body: weatherData == null ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'there is no weather 😔 start',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'searching now 🔍',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        )
            :Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[50]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(weatherData?.temp?.toInt().toString() ?? '',
                      style: const TextStyle(fontSize: 50,color: Colors.white),
                    ),
                    const Spacer(flex: 8,),
                    Image.asset(weatherData!.getImage()),
                    const Spacer(flex: 1,)

                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
              Provider.of<WeatherProvider>(context).cityName!,
              style: const TextStyle(fontSize: 35,color: Colors.white),),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(weatherData?.date ??'',style: const TextStyle(fontSize: 23,color: Colors.white),),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Max Temp : ${weatherData?.maxTemp?.toInt() ??''}',
                    style: const TextStyle(fontSize: 20,color: Colors.white),),
                  const Text(' / ',style: TextStyle(fontSize: 20,color: Colors.white),),
                  Text(
                    'Min Temp :${weatherData?.minTemp?.toInt() ??''}',
                    style: const TextStyle(fontSize: 20,color: Colors.white),),

                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weatherData?.weatherStateName ??'',
                    style: const TextStyle(fontSize: 40,color: Colors.white),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
