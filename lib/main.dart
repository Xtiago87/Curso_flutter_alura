import 'package:bytebank_sqlite/components/transaction_auth_dialog.dart';
import 'package:bytebank_sqlite/models/transaction.dart';
import 'package:bytebank_sqlite/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';



void main() {
  runApp(MyApp());
  print(Uuid().v4().characters);
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
