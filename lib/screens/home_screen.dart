import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../services/weather_service.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed(SearchScreen.routeName);
            },
          ),
        ],
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                'There is no weather yet! 😅 Start search to findout',
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Provider.of<WeatherProvider>(context).weatherData.getColorTheme(),
                    Provider.of<WeatherProvider>(context).weatherData.getColorTheme().withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 3),
                  Text(
                    city_name,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Spacer(flex: 1),
                  Text('Updated 12:10 PM',
                      style: TextStyle(
                        fontSize: 25,
                      )),
                  Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Temp:' + Provider.of<WeatherProvider>(context).weatherData.temp.toInt().toString(), style: TextStyle(fontSize: 30)),
                      Column(
                        children: [
                          Text('MinTemp:' + Provider.of<WeatherProvider>(context).weatherData.minTimp.toInt().toString()),
                          SizedBox(height: 5),
                          Text('MaxTemp' + Provider.of<WeatherProvider>(context).weatherData.maxTemp.toInt().toString()),
                        ],
                      ),
                    ],
                  ),
                  Spacer(flex: 1),
                  Text(Provider.of<WeatherProvider>(context).weatherData.weatherStateName.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  Spacer(flex: 4),
                ],
              ),
            ),
    );
  }
}
