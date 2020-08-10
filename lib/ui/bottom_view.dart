import 'package:flutter/material.dart';
import 'package:weatherforecastapp/model/podo_model.dart';

import 'forecast_card.dart';

class BottomView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;
  final BuildContext context;
  BottomView(this.snapshot, this.context);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var reqForecastList = [];
    for (int i = 0; i < forecastList.length; i++) {
      if (i % 8 == 0) {
        reqForecastList.add(forecastList[i]);
      }
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "5-Day Weather Forecast".toUpperCase(),
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: reqForecastList.length,
              separatorBuilder: (context, index) => SizedBox(width: 3.0),
              itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.4,
                      height: 160,
                      child: forecastCard(reqForecastList, index),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blueAccent, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight) //prefix.append 0xff
                          ),
                    ),
                  )),
        )
      ],
    );
  }
}
