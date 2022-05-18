// To parse this JSON data, do
//
//     final countriesModle = countriesModleFromJson(jsonString);

import 'dart:convert';

CountriesModle countriesModleFromJson(String str) => CountriesModle.fromJson(json.decode(str));

String countriesModleToJson(CountriesModle data) => json.encode(data.toJson());

class CountriesModle {
  CountriesModle({
    required this.id,
    required this.message,
    required this.countries,
    required this.date,
  });

  String id;
  String message;
  List<Country> countries;
  DateTime date;

  factory CountriesModle.fromJson(Map<String, dynamic> json) => CountriesModle(
    id: json["ID"].toString(),
    message: json["Message"].toString(),
    countries: List<Country>.from(json["Countries"].map((x) => Country.fromJson(x))),
    date: DateTime.parse(json["Date"]),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Message": message,
    "Countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    "Date": date.toIso8601String(),
  };
}

class Country {
  Country({
    required this.id,
    required this.countryIso,
    required this.country,
    required this.continent,
    required this.date,
    required this.totalCases,
    required this.newCases,
    required this.totalDeaths,
    required this.newDeaths,
    required this.totalCasesPerMillion,
    required this.newCasesPerMillion,
    required this.totalDeathsPerMillion,
    required this.newDeathsPerMillion,
    required this.stringencyIndex,
    required this.dailyIncidenceConfirmedCases,
    required this.dailyIncidenceConfirmedDeaths,
    required this.dailyIncidenceConfirmedCasesPerMillion,
    required this.dailyIncidenceConfirmedDeathsPerMillion,
    required this.incidenceRiskConfirmedPerHundredThousand,
    required this.incidenceRiskDeathsPerHundredThousand,
    required this.incidenceRiskNewConfirmedPerHundredThousand,
    required this.incidenceRiskNewDeathsPerHundredThousand,
    required this.caseFatalityRatio,
  });

  String id;
  String countryIso;
  String country;
  String continent;
  DateTime date;
  dynamic totalCases;
  dynamic newCases;
  dynamic totalDeaths;
  dynamic newDeaths;
  double totalCasesPerMillion;
  double newCasesPerMillion;
  double totalDeathsPerMillion;
  dynamic newDeathsPerMillion;
  dynamic stringencyIndex;
  dynamic dailyIncidenceConfirmedCases;
  double dailyIncidenceConfirmedDeaths;
  double dailyIncidenceConfirmedCasesPerMillion;
  double dailyIncidenceConfirmedDeathsPerMillion;
  double incidenceRiskConfirmedPerHundredThousand;
  double incidenceRiskDeathsPerHundredThousand;
  double incidenceRiskNewConfirmedPerHundredThousand;
  dynamic incidenceRiskNewDeathsPerHundredThousand;
  double caseFatalityRatio;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["ID"],
    countryIso: json["CountryISO"],
    country: json["Country"],
    continent: json["Continent"],
    date: DateTime.parse(json["Date"]),
    totalCases: json["TotalCases"],
    newCases: json["NewCases"],
    totalDeaths: json["TotalDeaths"],
    newDeaths: json["NewDeaths"],
    totalCasesPerMillion: json["TotalCasesPerMillion"].toDouble(),
    newCasesPerMillion: json["NewCasesPerMillion"].toDouble(),
    totalDeathsPerMillion: json["TotalDeathsPerMillion"].toDouble(),
    newDeathsPerMillion: json["NewDeathsPerMillion"],
    stringencyIndex: json["StringencyIndex"],
    dailyIncidenceConfirmedCases: json["DailyIncidenceConfirmedCases"],
    dailyIncidenceConfirmedDeaths: json["DailyIncidenceConfirmedDeaths"].toDouble(),
    dailyIncidenceConfirmedCasesPerMillion: json["DailyIncidenceConfirmedCasesPerMillion"].toDouble(),
    dailyIncidenceConfirmedDeathsPerMillion: json["DailyIncidenceConfirmedDeathsPerMillion"].toDouble(),
    incidenceRiskConfirmedPerHundredThousand: json["IncidenceRiskConfirmedPerHundredThousand"].toDouble(),
    incidenceRiskDeathsPerHundredThousand: json["IncidenceRiskDeathsPerHundredThousand"].toDouble(),
    incidenceRiskNewConfirmedPerHundredThousand: json["IncidenceRiskNewConfirmedPerHundredThousand"].toDouble(),
    incidenceRiskNewDeathsPerHundredThousand: json["IncidenceRiskNewDeathsPerHundredThousand"],
    caseFatalityRatio: json["CaseFatalityRatio"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CountryISO": countryIso,
    "Country": country,
    "Continent": continent,
    "Date": date.toIso8601String(),
    "TotalCases": totalCases,
    "NewCases": newCases,
    "TotalDeaths": totalDeaths,
    "NewDeaths": newDeaths,
    "TotalCasesPerMillion": totalCasesPerMillion,
    "NewCasesPerMillion": newCasesPerMillion,
    "TotalDeathsPerMillion": totalDeathsPerMillion,
    "NewDeathsPerMillion": newDeathsPerMillion,
    "StringencyIndex": stringencyIndex,
    "DailyIncidenceConfirmedCases": dailyIncidenceConfirmedCases,
    "DailyIncidenceConfirmedDeaths": dailyIncidenceConfirmedDeaths,
    "DailyIncidenceConfirmedCasesPerMillion": dailyIncidenceConfirmedCasesPerMillion,
    "DailyIncidenceConfirmedDeathsPerMillion": dailyIncidenceConfirmedDeathsPerMillion,
    "IncidenceRiskConfirmedPerHundredThousand": incidenceRiskConfirmedPerHundredThousand,
    "IncidenceRiskDeathsPerHundredThousand": incidenceRiskDeathsPerHundredThousand,
    "IncidenceRiskNewConfirmedPerHundredThousand": incidenceRiskNewConfirmedPerHundredThousand,
    "IncidenceRiskNewDeathsPerHundredThousand": incidenceRiskNewDeathsPerHundredThousand,
    "CaseFatalityRatio": caseFatalityRatio,
  };
}
