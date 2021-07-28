import 'package:bytebank_sqlite/components/editor.dart';
import 'package:bytebank_sqlite/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Receber deposito"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                dica: "0.00",
                controlador: _controladorCampoValor,
                rotulo: "Valor",
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text("Confirmar"),
                onPressed: () => _criaDeposito(context),
              ),
            ],
          ),
        ));
  }

  _criaDeposito(BuildContext context) {
    final double? valor = double.tryParse(_controladorCampoValor.text);
    final depositovalido = _validaDeposito(valor);

    if (depositovalido) {
      _atualizaEstado(context, valor);

      Navigator.pop(context);
    }
  }

  _validaDeposito(valor) {
    final _campoPreenchido = valor != null;

    return _campoPreenchido;
  }

  _atualizaEstado(context, valor) {
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }
}
