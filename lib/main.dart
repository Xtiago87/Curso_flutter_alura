import 'package:bytebank_sqlite/screens/dashboard.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
  // save(Transaction(274.0, Contact(0, "alexiu", 5000)))
  //     .then((value) => print(value));
  // findAll().then((value) => print("new transactions $value"));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary)),
      home: Dashboard(),
    );
  }
}
