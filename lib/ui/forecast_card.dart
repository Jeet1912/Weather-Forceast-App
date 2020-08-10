import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherforecastapp/util/converticon.dart';
import 'package:weatherforecastapp/util/util.dart';

Widget forecastCard(List reqList, int i) {
  var dayOfWeek = "";
  var fullDate = Util.getFormattedDate(
      new DateTime.fromMillisecondsSinceEpoch(reqList[i].dt * 1000));
  dayOfWeek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(reqList[i].weather[0].main, Colors.blue, 35),
          ),

          Padding(
            padding: const EdgeInsets.only(left:10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${reqList[i].main.tempMin.toStringAsFixed(1)}"),
                    Icon(Icons.arrow_downward, size: 20,)
                    //Icon(),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${reqList[i].main.tempMax.toStringAsFixed(1)}"),
                    Icon(Icons.arrow_upward,size: 20,)
                    //Icon(),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${reqList[i].main.humidity.toStringAsFixed(1)}"),
                    Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20,)
                    //Icon(),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${reqList[i].wind.speed.toStringAsFixed(1)}"),
                    SizedBox(width: 6,),
                    Icon(FontAwesomeIcons.wind,size: 20,)
                    //Icon(),
                  ],
                ),
              ],
            ),
          ),

        ],
      )
    ],
  );
}