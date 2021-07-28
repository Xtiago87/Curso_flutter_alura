import 'package:bytebank_sqlite/models/saldo.dart';
import 'package:bytebank_sqlite/screens/dashboard/saldo_card.dart';
import 'package:bytebank_sqlite/screens/deposito/formulario.dart';
import 'package:bytebank_sqlite/screens/transferencia/formulario.dart';
import 'package:bytebank_sqlite/screens/transferencia/lista.dart';
import 'package:bytebank_sqlite/screens/transferencia/ultimas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bytebank"),
      ),
      body: ListView(children: [
        Align(alignment: Alignment.topCenter, child: SaldoCard()),
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 180.0, height: 35),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FormularioDeposito();
                    }));
                  },
                  child: Text("Receber deposito",
                      style: TextStyle(fontSize: 16))),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 180.0, height: 35),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FormularioTransferencia();
                    }));
                  },
                  child: Text("Nova transferencia",
                      style: TextStyle(fontSize: 16))),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: UltimasTransferencias(),
        )
      ]),
    );
  }
}
