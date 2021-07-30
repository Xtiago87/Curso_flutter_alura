import 'package:bytebank_sqlite/components/container.dart';
import 'package:bytebank_sqlite/models/name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class NameContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

class NameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();

    //agr n tem problema essa abordagem pois n vamos fazer um rebuild quando
    //o estado é alterado
    _nameController.text = context.read<NameCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change name"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Desired name: "),
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  final name = _nameController.text;
                  context.read<NameCubit>().change(name);
                  Navigator.pop(context);
                },
                child: Text("change"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
