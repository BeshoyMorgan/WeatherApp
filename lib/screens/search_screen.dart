import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = "search_screen";
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search For Weather'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 150, 20, 20),
        child: Column(
          children: [
            Text(
              'Search For the City',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                labelText: 'Search',
                labelStyle: Theme.of(context).textTheme.headline3,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              keyboardType: TextInputType.name,
              controller: controller,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Search', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                WeatherModel weather = await getWeather(controller.text);
                Provider.of<WeatherProvider>(context, listen: false).WeatherData = weather;

                Navigator.of(context).pop();
              },
              color: Colors.blue,
              splashColor: Colors.orange,
              elevation: 4,
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
