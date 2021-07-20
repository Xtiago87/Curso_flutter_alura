import 'package:bytebank_sqlite/components/progress.dart';

import 'package:bytebank_sqlite/database/dao/contact_dao.dart';
import 'package:bytebank_sqlite/models/contact.dart';
import 'package:bytebank_sqlite/screens/contact_form.dart';
import 'package:bytebank_sqlite/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none: //ainda n foi executado
            // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              Progress();
              break;
            case ConnectionState.active:
            // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Contact>? contacts = snapshot
                  .data; // usado null safe na lista pois é regra da nova versão do flutter
              if (contacts != null) {
                //feito if para validar nulo
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return _ContactItem(
                      contact,
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) =>
                            TransactionForm(contact))
                        );
                      },
                    );
                  },
                  itemCount: contacts.length,
                );
              }
              break;
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then((newContact) {
            setState(() {});
            debugPrint(newContact.toString());
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  _ContactItem(this.contact, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: ListTile(
        onTap: () {
          onClick();
        },
        title: Text(
          contact.name.toString(),
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
    );
  }
}
