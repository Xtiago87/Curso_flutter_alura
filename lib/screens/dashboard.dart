import 'package:bytebank_sqlite/screens/contacts_list.dart';
import 'package:bytebank_sqlite/screens/transactions_list.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/bytebank_logo.png"),
          ),
          Row(children: [
            _FeatureItem("Transfer", Icons.monetization_on, onClick: () {
              _showContactList(context);
            }),
            _FeatureItem("Transaction Feed", Icons.description, onClick: () {
              _showTransactionList(context);
            })
          ])
        ],
      ),
    );
  }
}


class _FeatureItem extends StatelessWidget {
  final String? name;
  final IconData? icon;
  final Function onClick;

  _FeatureItem(this.name, this.icon, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme
            .of(context)
            .primaryColor,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            color: Theme
                .of(context)
                .primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(icon!, color: Colors.white, size: 32.0),
                Text(
                  name!,
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showContactList(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ContactsList()));
}

void _showTransactionList(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TransactionsList()));
}
