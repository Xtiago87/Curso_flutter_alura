import 'package:bytebank_sqlite/database/dao/contact_dao.dart';
import 'package:bytebank_sqlite/models/contact.dart';
import 'package:bytebank_sqlite/widgets/app_dependency.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dependencies = AppDependencies.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("New contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Full name"),
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              controller: _accountNumberController,
              decoration: InputDecoration(labelText: "Account number"),
              style: TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String? name = _nameController.text;
                    final int? accountNumber =
                        int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(1, name, accountNumber);
                    _save(newContact, context, dependencies!.contactDao);
                  },
                  child: Text("Create"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _save(Contact newContact, BuildContext context, ContactDao contactDao) async {
    await contactDao.save(newContact);
    Navigator.pop(context);
  }
}
