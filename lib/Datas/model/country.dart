class CountryModel{
  final String countries;
  // final String slug;
  // final String iso2;

   CountryModel(this.countries);//, this.slug, this.iso2

  factory CountryModel.fromJson(Map<String, dynamic> json){
    return CountryModel(
      json["country"],
      // json["Slug"],
      // json["ISO2"],
    );
  }
}