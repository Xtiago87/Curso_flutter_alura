import 'package:bytebank_sqlite/models/transferencias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'lista.dart';

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Ultimas transferencias",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final _quantidade = transferencias.transferencias.length;
          final _ultimasTransferencias =
              transferencias.transferencias.reversed.toList();
          int tamanho = 2;
          if (_quantidade < 3) {
            tamanho = _quantidade;
          }
          if (_quantidade == 0) {
            return SemTransferenciaCadastrada();
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: tamanho,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              return ItemTransferencia(_ultimasTransferencias[indice]);
            },
          );
        }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: double.maxFinite,height: 35),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListaTransferencias();
                  }));
                },
                child: Text("Ver todas as transferencias", style: TextStyle(fontSize: 20))),
          ),
        )
      ],
    );
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Vc ainda nao cadastrou nenhuma transfeerncias",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      elevation: 10,
    );
  }
}
