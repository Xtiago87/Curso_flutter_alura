import 'package:bytebank_sqlite/components/container.dart';
import 'package:bytebank_sqlite/components/featureItem.dart';
import 'package:bytebank_sqlite/models/name.dart';
import 'package:bytebank_sqlite/screens/contacts_list.dart';
import 'package:bytebank_sqlite/screens/name.dart';
import 'package:bytebank_sqlite/screens/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit("Tiago"),
      child: DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NameCubit, String>(
          builder: (context, state) => Text("Welome $state"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/bytebank_logo.png"),
          ),
          SingleChildScrollView(
            child: Container(
              height: 120,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                FeatureItem("Transfer", Icons.monetization_on, onClick: () {
                  _showContactList(context);
                }),
                FeatureItem("Transaction Feed", Icons.description, onClick: () {
                  _showTransactionList(context);
                }),
                FeatureItem("Change name", Icons.person_outline, onClick: () {
                  _showChangeName(context);
                }),
              ]),
            ),
          )
        ],
      ),
    );
  }
}

void _showContactList(BuildContext context) {
  push(context, ContactsListContainer());
}

void _showTransactionList(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => TransactionsList()));
}

void _showChangeName(BuildContext blocContext) {
  Navigator.of(blocContext).push(MaterialPageRoute(
      builder: (context) => BlocProvider.value(
          value: BlocProvider.of<NameCubit>(blocContext),
          child: NameContainer())));
}
