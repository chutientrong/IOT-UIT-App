class GlobalSummaryModel{
  final int cases;
  final int todayCases;
  final int todayDeaths;
  final int deaths;
  final int todayRecovered;
  final int recovered;
  // final DateTime date;

  GlobalSummaryModel(this.todayCases, this.cases, this.todayDeaths, this.deaths, this.todayRecovered, this.recovered);// , this.date

  factory GlobalSummaryModel.fromJson(Map<String, dynamic> json){
    return GlobalSummaryModel(
      json["todayCases"],
      json["cases"],
      json["todayDeaths"],
      json["deaths"],
      json["todayRecovered"],
      json["recovered"],
      // DateTime.parse(json["Date"]),
    );
  }
}
