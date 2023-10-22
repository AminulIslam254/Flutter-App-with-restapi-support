import 'package:flutter/material.dart';

class CountryDetails extends StatelessWidget {
  const CountryDetails({super.key});

  @override
  Widget build(BuildContext mainContext) {
    var args = ModalRoute.of(mainContext)!.settings.arguments as List<String>;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(mainContext);
            },
          ),
        ),
        body: Center(
          child: 
          
        ),
      ),
    );
  }
}
