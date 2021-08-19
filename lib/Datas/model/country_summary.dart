
class CountrySummaryModel{
  final int cases;
  final int todayCases;
  final int todayDeaths;
  final int deaths;
  final int todayRecovered;
  final int recovered;
  // final DateTime date;

  CountrySummaryModel(this.todayCases, this.cases, this.todayDeaths, this.deaths, this.todayRecovered, this.recovered);// , this.date

  factory CountrySummaryModel.fromJson(Map<String, dynamic> json){
    return CountrySummaryModel(
      json["todayCases"],
      json["cases"],
      json["todayDeaths"],
      json["deaths"],
      json["todayRecovered"],
      json["recovered"],
      // DateTime.parse(json["Date"]),
    );

  }
  // List<CountrySummaryModel> summaryLists(String json) {
  //   if (json == null) {
  //     return [];
  //   }
  //
  //   final List<dynamic> parsed = jsonDecode(json);
  //   return parsed.map((json) => CountrySummaryModel.fromJson(json)).toList();
  // }

}