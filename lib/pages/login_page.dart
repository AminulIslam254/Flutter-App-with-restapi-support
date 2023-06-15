import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Image.asset(
              "assets/images/login1.jpg",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Image Name is ...",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      label: Text("UserName"),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: ("Enter Password"),
                      label: Text("Password"),
                    ),
                  ),

                  ElevatedButton(onPressed: (){
                    print("Clicked");
                  }, child: Text("Click Me"))
                ],
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
