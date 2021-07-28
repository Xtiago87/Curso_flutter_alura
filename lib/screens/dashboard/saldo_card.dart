import 'package:bytebank_sqlite/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaldoCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<Saldo>(
            builder: (context, valor, child) {
              return Text(
                valor.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              );
            },
          )),
    );
  }
}
