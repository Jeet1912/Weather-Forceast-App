

import 'package:flutter/material.dart';
import 'package:weatherforecastapp/model/podo_model.dart';
import 'package:weatherforecastapp/network/fetching.dart';
import 'package:weatherforecastapp/ui/bottom_view.dart';
import 'package:weatherforecastapp/ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastobj;

  String cityname = "Hyderabad";

  @override
  void initState() {
    super.initState();
    forecastobj = Network().getWeatherForecast(cityName: cityname);
    print(forecastobj);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          textFieldView(),
          SizedBox(
            height: 10,
          ),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
                future: forecastobj,
                builder: (BuildContext context,
                    AsyncSnapshot<WeatherForecastModel> snapshot) {
                  print("snapshot : $snapshot");
                  if (snapshot.hasData) {
                    //print("Snapshot has data :)");
                    return Column(
                      children: <Widget>[
                        MidView(snapshot),
                        SizedBox(height: 15,),
                        BottomView(snapshot, context)
                      ],
                    );
                  } else {
                    print("c'mon");
                    return Container(
                        child: Center(child: CircularProgressIndicator()));
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: "Enter City",
            prefixIcon: Icon(Icons.search),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
        onSubmitted: (value) {
           setState(() {
            cityname = value;
            forecastobj = new Network().getWeatherForecast(cityName: cityname);
          });
        },
      ),
    );
  }
}
