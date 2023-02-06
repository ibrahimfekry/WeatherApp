import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:hexcolor/hexcolor.dart';

bool darkMode = false;
void main() {
  runApp( ChangeNotifierProvider(

      create: ( context) {
        return WeatherProvider();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  WeatherAppWithTheme();
  }
}
class WeatherAppWithTheme extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    WeatherProvider theme = Provider.of<WeatherProvider>( context);
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme:iconBool ?  lightTheme :darkTheme ,

        // ThemeData(
      //   primarySwatch:Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue :
      //   Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
      //   // appBarTheme: AppBarTheme(
      //   //   systemOverlayStyle: SystemUiOverlayStyle(
      //   //     statusBarColor: HexColor('333739'),
      //   //     statusBarIconBrightness: Brightness.light,
      //   //   ),
      //   //   backgroundColor: HexColor('333739'),
      //   //   elevation: 0.0,
      //   //   titleTextStyle: TextStyle(
      //   //     color: Colors.white,
      //   //   ),
      //   //   iconTheme: IconThemeData(
      //   //     color: Colors.white,
      //   //   ),
      //   //
      //   // ),
      // ),
      // darkTheme: ThemeData(
      //   scaffoldBackgroundColor: HexColor('333739'),
      // ),
      // themeMode: ThemeMode.light ,
      home: HomePage(),
    );
  }
}