import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Country {
  String name;
  List<String> topLevelDomain;
  String alpha2Code;
  String alpha3Code;
  List<String> callingCodes;
  String capital;
  String subregion;
  String region;
  int population;
  String demonym;
  int area;
  List<String> timezones;
  List<String> borders;
  String nativeName;
  String numericCode;
  Map<String, String> flags;
  List<Language> languages;
  String flag;
  bool independent;

  Country({
    required this.name,
    required this.topLevelDomain,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.callingCodes,
    required this.capital,
    required this.subregion,
    required this.region,
    required this.population,
    required this.demonym,
    required this.area,
    required this.timezones,
    required this.borders,
    required this.nativeName,
    required this.numericCode,
    required this.flags,
    required this.languages,
    required this.flag,
    required this.independent,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      topLevelDomain: List<String>.from(json['topLevelDomain']),
      alpha2Code: json['alpha2Code'],
      alpha3Code: json['alpha3Code'],
      callingCodes: List<String>.from(json['callingCodes']),
      capital: json['capital'] ?? '',
      subregion: json['subregion'],
      region: json['region'],
      population: json['population'],
      demonym: json['demonym'],
      area: json['area'] != null
          ? ((json['area'] is int)
              ? json['area']
              : (json['area'] as double).toInt())
          : 0,
      timezones: List<String>.from(json['timezones']),
      borders:
          json['borders'] != null ? List<String>.from(json['borders']) : [],
      nativeName: json['nativeName'],
      numericCode: json['numericCode'],
      flags: Map<String, String>.from(json['flags']),
      languages: json['languages'] != null
          ? List<Language>.from(
              json['languages'].map((x) => Language.fromJson(x)))
          : [],
      flag: json['flag'],
      independent: json['independent'],
    );
  }
}

class Currency {
  String code;
  String name;
  String symbol;

  Currency({required this.code, required this.name, required this.symbol});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'],
      name: json['name'],
      symbol: json['symbol'],
    );
  }
}

class Language {
  String iso639_1;
  String iso639_2;
  String name;
  String nativeName;

  Language({
    required this.iso639_1,
    required this.iso639_2,
    required this.name,
    required this.nativeName,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      iso639_1: json['iso639_1'] != null ? json['iso639_1'] : "",
      iso639_2: json['iso639_2'] != null ? json['iso639_2'] : "",
      name: json['name'],
      nativeName: json['nativeName'] != null ? json['nativeName'] : "",
    );
  }
}

class RegionalBloc {
  String acronym;
  String name;

  RegionalBloc({required this.acronym, required this.name});

  factory RegionalBloc.fromJson(Map<String, dynamic> json) {
    return RegionalBloc(
      acronym: json['acronym'],
      name: json['name'],
    );
  }
}

class CountryHomePage extends StatelessWidget {
  const CountryHomePage({super.key});

  @override
  Widget build(BuildContext mainContext) {
    Future<List<Country>> fetchdata() async {
      final String response =
          await rootBundle.loadString('assets/CountryJsonData/data.json');
      List<dynamic> jsonData = jsonDecode(response);
      List<Country> modifiedData =
          jsonData.map((item) => Country.fromJson(item)).toList();
      return modifiedData;
    }

    var myData = fetchdata();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(leading: BackButton(
            onPressed: () {
              Navigator.pop(mainContext);
            },
          )),
          body: Center(
            child: FutureBuilder<List<Country>>(
              future: fetchdata(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Country> countries = snapshot.data!;
                  return ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(mainContext, "/details",arguments:[countries[index].numericCode]);
                        },
                          child: Card(
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              countries[index].flags['png']!, // Assuming flag contains the image URL
                              width: 100, // Set the image width as needed
                              height: 100, // Set the image height as needed
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(countries[index].name),
                            ),
                            // Add more data fields as needed
                          ],
                        ),
                      ));
                    },
                  );
                } else {
                  return Text('${snapshot.data} hehe');
                }
              },
            ),
          )),
    );
  }
}
