
import 'package:bytebank_sqlite/screens/dashboard.dart';
import 'package:bytebank_sqlite/screens/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'components/theme.dart';

void main() {
  runApp(MyApp());
}

class LogObserver extends BlocObserver {
 @override
  void onChange(BlocBase bloc, Change change) {
    print("${bloc.runtimeType} > $change");
    super.onChange(bloc, change);
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //na pratica evitar log do genero, pois pode vazar informacoes sensiveis para o log
    Bloc.observer = LogObserver();
    return MaterialApp(
      theme: bytebankTheme,
      home: DashboardContainer(),
    );
  }
}


