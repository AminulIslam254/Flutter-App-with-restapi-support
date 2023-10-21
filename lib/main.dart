import 'package:flutter/material.dart';
import 'package:proj2/pages/home_page.dart';
import 'package:proj2/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        "/":(context)=>LoginPage(),
        "/home":(context)=>HomePage()
      },
    );
  }
}

