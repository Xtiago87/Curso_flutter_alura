import 'package:bytebank_sqlite/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Transferencias extends ChangeNotifier {
  final List<Transferencia> _transferencias = [];

  List<Transferencia> get transferencias => _transferencias;

  adiciona(Transferencia novaTransferencia) {
    transferencias.add(novaTransferencia);
    notifyListeners();
  }
}
