import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class responseData {
  final int userId;
  final int id;
  final String title;

  responseData({required this.userId, required this.id, required this.title});
  factory responseData.fromJson(Map<String, dynamic> json) {
    return responseData(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as List<String>;
    Future<List<responseData>> fetchAlbum() async {
      final res = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      List<dynamic> jsonData = jsonDecode(res.body);
      List<responseData> modifiedData =
          jsonData.map((item) => responseData.fromJson(item)).toList();
      return modifiedData;
    }

    var myRes = fetchAlbum();

    // print(args[1]);
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body: Center(
        child: FutureBuilder<List<responseData>>(
          future: myRes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(snapshot.data![index].title),
                      subtitle: Text(snapshot.data![index].id.toString()));
                },
              );
            }
            else{
              return Text("data");
            }
          },
        ),
      ),
    )
    );
  }
}
