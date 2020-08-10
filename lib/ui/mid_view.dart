import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherforecastapp/model/podo_model.dart';
import 'package:weatherforecastapp/util/converticon.dart';
import 'package:weatherforecastapp/util/util.dart';

class MidView extends StatelessWidget  {

final AsyncSnapshot<WeatherForecastModel> snapshot;

MidView(this.snapshot);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
   var name2 = snapshot.data.city.name;      
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("$name2,${snapshot.data.city.country}", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 10,),
        Text("${Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt*1000))}", style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: getWeatherIcon(forecastList[0].weather[0].main,  Colors.blueAccent, 195),
        ) ,

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${forecastList[0].main.temp.toString()}°F",style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("${forecastList[0].weather[0].description.toUpperCase()}", style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold
              ),),
            )
          ],
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("${forecastList[0].main.humidity}%"),
                Icon(FontAwesomeIcons.solidGrinBeamSweat)
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("${forecastList[0].wind.speed.toString()} mph"),
                  Icon(FontAwesomeIcons.wind)
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("${forecastList[0].main.feelsLike.toStringAsFixed(0)}°F"),
                Icon(FontAwesomeIcons.temperatureHigh)
                //Icon(FontAw)
              ],
            )
          ],
        )
      ],
    ),
  );
  }
}

