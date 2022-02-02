import 'package:flutter/material.dart';
import './screens/search_screen.dart';
import './screens/home_screen.dart';
import 'package:provider/provider.dart';
import './providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePageScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
      },
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.teal : Provider.of<WeatherProvider>(context).weatherData.getColorTheme(),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline3: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
              ),
              headline2: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              headline1: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
