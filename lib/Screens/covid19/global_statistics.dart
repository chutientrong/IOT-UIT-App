import 'package:flutter/material.dart';
import 'package:iot_aplication/Datas/model/global_summary.dart';
import 'package:iot_aplication/utilities/constants.dart';
import 'package:timeago/timeago.dart' as timeago;


class GlobalStatistics extends StatelessWidget {

  final GlobalSummaryModel summary;

  GlobalStatistics({@required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        buildCard(
          "CONFIRMED",
          summary.cases,
          summary.todayCases,
          kConfirmedColor
        ),

        buildCard(
          "ACTIVE",
          summary.cases - summary.recovered - summary.deaths,
          summary.todayCases - summary.todayRecovered - summary.todayDeaths,
          kActiveColor
        ),

        buildCard(
          "RECOVERED",
          summary.recovered,
          summary.todayRecovered,
          kRecoveredColor
        ),

        buildCard(
          "DEATH",
          summary.deaths,
          summary.todayDeaths,
          kDeathColor
        ),

        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        //   child: Text(
        //     "Statistics updated " + timeago.format(summary.date),
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 14,
        //     ),
        //   ),
        // ),

      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color){
    return Card(
      elevation: 1,
      child: Container(
        height: 87,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[

            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),

            Expanded(
              child: Container(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      "Total",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      totalCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),

                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    Text(
                      "Today",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      todayCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),

                  ],
                ),

                
              ],
            ),
          ],
        ),
      ),
    );
  }
}