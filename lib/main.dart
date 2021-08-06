import 'package:bytebank_sqlite/components/transaction_auth_dialog.dart';
import 'package:bytebank_sqlite/database/dao/contact_dao.dart';
import 'package:bytebank_sqlite/models/transaction.dart';
import 'package:bytebank_sqlite/screens/dashboard.dart';
import 'package:bytebank_sqlite/widgets/app_dependency.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'http/webclients/transaction_webclients.dart';

void main() {
  runApp(MyApp(contactDao: ContactDao(), transactionWebClient: TransactionWebClient(),));
  print(Uuid().v4().characters);
}

class MyApp extends StatelessWidget {
  final ContactDao contactDao;
  final TransactionWebClient transactionWebClient;

  MyApp({required this.contactDao, required this.transactionWebClient});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      contactDao: contactDao,
      transactionWebClient: transactionWebClient,
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.green[900],
            accentColor: Colors.blueAccent[700],
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.blueAccent[700],
                textTheme: ButtonTextTheme.primary)),
        home: Dashboard(),
      ),
    );
  }
}
