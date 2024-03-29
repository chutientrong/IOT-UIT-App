import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:iot_aplication/Datas/model/country_summary.dart';

import 'package:iot_aplication/utilities/constants.dart';


class CountryStatistics extends StatelessWidget {

  // final List<CountrySummaryModel> summaryList;
  final CountrySummaryModel summaryList;

  CountryStatistics({@required this.summaryList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        buildCard(
            "CONFIRMED",
            summaryList.cases,
            summaryList.todayCases,
            kConfirmedColor
        ),

        buildCard(
            "ACTIVE",
            summaryList.cases - summaryList.recovered - summaryList.deaths,
            summaryList.todayCases - summaryList.todayRecovered - summaryList.todayDeaths,
            kActiveColor
        ),

        buildCard(
            "RECOVERED",
            summaryList.recovered,
            summaryList.todayRecovered,
            kRecoveredColor
        ),

        buildCard(
            "DEATH",
            summaryList.deaths,
            summaryList.todayDeaths,
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
  //   return Column(
  //     children: <Widget>[
  //
  //       buildCard(
  //         "CONFIRMED",
  //         // summaryList[summaryList.length - 1].cases,
  //         summaryList.cases,
  //         kConfirmedColor,
  //         "ACTIVE",
  //         // summaryList[summaryList.length - 1].active,
  //         summaryList.active,
  //         kActiveColor,
  //       ),
  //
  //       buildCard(
  //         "RECOVERED",
  //         // summaryList[summaryList.length - 1].recovered,
  //         summaryList.recovered,
  //         kRecoveredColor,
  //         "DEATH",
  //         // summaryList[summaryList.length - 1].deaths,
  //         summaryList.deaths,
  //         kDeathColor,
  //       ),
  //
  //       // buildCardChart(summaryList),
  //
  //     ],
  //   );
  // }
  //
  // Widget buildCard(String leftTitle, int leftValue, Color leftColor, String rightTitle, int rightValue, Color rightColor){
  //   return Card(
  //     elevation: 1,
  //     child: Container(
  //       height: 87,
  //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: <Widget>[
  //
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //
  //               Text(
  //                 leftTitle,
  //                 style: TextStyle(
  //                   color: Colors.grey,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 14,
  //                 ),
  //               ),
  //
  //               Expanded(
  //                 child: Container(),
  //               ),
  //
  //               Text(
  //                 "Total",
  //                 style: TextStyle(
  //                   color: leftColor,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 12,
  //                 ),
  //               ),
  //
  //               Text(
  //                 leftValue.toString().replaceAllMapped(reg, mathFunc),
  //                 style: TextStyle(
  //                   color: leftColor,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 25,
  //                 ),
  //               ),
  //             ],
  //           ),
  //
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             children: <Widget>[
  //
  //               Text(
  //                 rightTitle,
  //                 style: TextStyle(
  //                   color: Colors.grey,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 14,
  //                 ),
  //               ),
  //
  //               Expanded(
  //                 child: Container(),
  //               ),
  //
  //                Text(
  //                 "Total",
  //                 style: TextStyle(
  //                   color: rightColor,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 12,
  //                 ),
  //               ),
  //
  //               Text(
  //                 rightValue.toString().replaceAllMapped(reg, mathFunc),
  //                 style: TextStyle(
  //                   color: rightColor,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 25,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // // Widget buildCardChart(List<CountrySummaryModel> summaryList){
  // //   return Card(
  // //     elevation: 1,
  // //     child: Container(
  // //       height: 150,
  // //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  // //       child: Chart(
  // //         _createData(summaryList),
  // //         animate: false,
  // //       ),
  // //     ),
  // //   );
  // // }
  // //
  // // static List<charts.Series<TimeSeriesCases, DateTime>> _createData(List<CountrySummaryModel> summaryList) {
  // //
  // //   List<TimeSeriesCases> confirmedData = [];
  // //   List<TimeSeriesCases> activeData = [];
  // //   List<TimeSeriesCases> recoveredData = [];
  // //   List<TimeSeriesCases> deathData = [];
  // //
  // //   for (var item in summaryList) {
  // //     confirmedData.add(TimeSeriesCases(item.cases)); //item.date,
  // //     activeData.add(TimeSeriesCases(item.active));//item.date,
  // //     recoveredData.add(TimeSeriesCases(item.recovered));//item.date,
  // //     deathData.add(TimeSeriesCases(item.deaths));//item.date,
  // //   }
  // //
  // //   return [
  // //     new charts.Series<TimeSeriesCases, DateTime>(
  // //       id: 'Confirmed',
  // //       colorFn: (_, __) => charts.ColorUtil.fromDartColor(kConfirmedColor),
  // //       // domainFn: (TimeSeriesCases cases, _) => cases.time,
  // //       measureFn: (TimeSeriesCases cases, _) => cases.cases,
  // //       data: confirmedData,
  // //     ),
  // //     new charts.Series<TimeSeriesCases, DateTime>(
  // //       id: 'Active',
  // //       colorFn: (_, __) => charts.ColorUtil.fromDartColor(kActiveColor),
  // //       // domainFn: (TimeSeriesCases cases, _) => cases.time,
  // //       measureFn: (TimeSeriesCases cases, _) => cases.cases,
  // //       data: activeData,
  // //     ),
  // //     new charts.Series<TimeSeriesCases, DateTime>(
  // //       id: 'Recovered',
  // //       colorFn: (_, __) => charts.ColorUtil.fromDartColor(kRecoveredColor),
  // //       // domainFn: (TimeSeriesCases cases, _) => cases.time,
  // //       measureFn: (TimeSeriesCases cases, _) => cases.cases,
  // //       data: recoveredData,
  // //     ),
  // //     new charts.Series<TimeSeriesCases, DateTime>(
  // //       id: 'Death',
  // //       colorFn: (_, __) => charts.ColorUtil.fromDartColor(kDeathColor),
  // //       // domainFn: (TimeSeriesCases cases, _) => cases.time,
  // //       measureFn: (TimeSeriesCases cases, _) => cases.cases,
  // //       data: deathData,
  // //     ),
  // //
  // //   ];
  // // }

}