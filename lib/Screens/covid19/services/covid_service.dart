import 'package:http/http.dart' as http;
import 'package:iot_aplication/Datas/model/country.dart';
import 'package:iot_aplication/Datas/model/country_summary.dart';
import 'dart:convert';
import 'package:iot_aplication/Datas/model/global_summary.dart';

class CovidService{

  Future<GlobalSummaryModel> getGlobalSummary() async{
    // final data = await http.Client().get(Uri.parse("https://api.covid19api.com/summary"));
    final data = await http.Client().get(Uri.parse("https://disease.sh/v3/covid-19/all"));
    
    if(data.statusCode != 200)
      throw Exception();
      
    GlobalSummaryModel summary = new GlobalSummaryModel.fromJson(json.decode(data.body));
    return summary;
  }

  // Future<List<CountrySummaryModel>> getCountrySummary(String countries) async{
  Future<CountrySummaryModel> getCountrySummary(String country) async{
    // final data = await http.Client().get(Uri.parse("https://api.covid19api.com/total/dayone/country/" + countries));
    final data = await http.Client().get(Uri.parse("https://disease.sh/v3/covid-19/countries/" + country));
    
    if(data.statusCode != 200)
      throw Exception();

    // List<CountrySummaryModel> summaryList = (json.decode(data.body) as List).map((item) => new CountrySummaryModel.fromJson(item)).toList();
    CountrySummaryModel summaryList = new CountrySummaryModel.fromJson(json.decode(data.body));

    return summaryList;
  }

  Future<List<CountryModel>> getCountryList() async{
    // final data = await http.Client().get(Uri.parse("https://api.covid19api.com/countries"));
    final data = await http.Client().get(Uri.parse("https://disease.sh/v3/covid-19/countries"));
    
    if(data.statusCode != 200)
      throw Exception();

    List<CountryModel> countries = (json.decode(data.body) as List).map((item) => new CountryModel.fromJson(item)).toList();
    
    return countries;
  }

}