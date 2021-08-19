import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_aplication/Datas/model/weatherdataset.dart';

class ExtraWeather extends StatelessWidget {
  final Weather temp;
  ExtraWeather(this.temp);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(
              CupertinoIcons.wind,
              color: Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              temp.wind.toString() + " Km/h",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Wind",
              style: TextStyle(color: Colors.black, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            Icon(
              CupertinoIcons.drop,
              color: Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              temp.humidity.toString() + " %",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Humidity",
              style: TextStyle(color: Colors.black, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            Icon(
              CupertinoIcons.cloud_rain,
              color: Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              temp.chanceRain.toString() + " %",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Rain",
              style: TextStyle(color: Colors.black, fontSize: 16),
            )
          ],
        )
      ],
    );
  }
}