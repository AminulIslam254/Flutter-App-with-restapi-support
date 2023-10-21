import 'package:flutter/material.dart';
import 'package:proj2/pages/home_page.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    String name="";
    String Password="";
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("hi"),
            centerTitle: true,
          ),
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Name",
                    ),
                    onChanged: (value) => {name=value},
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Enter Password"),
                    onChanged: (value) => {Password=value},
                  ),
                  TextButton(onPressed: (){Navigator.pushNamed(
                    context,
                    "/home",
                    arguments:[name,Password]
                  );
                  }, child: Text("button"),style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.amber.shade400)),)
                ],
              ))),
    );
  }
}
