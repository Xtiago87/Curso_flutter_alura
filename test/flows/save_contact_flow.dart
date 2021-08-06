import 'dart:io';

import 'package:bytebank_sqlite/main.dart';
import 'package:bytebank_sqlite/models/contact.dart';
import 'package:bytebank_sqlite/screens/contact_form.dart';
import 'package:bytebank_sqlite/screens/contacts_list.dart';
import 'package:bytebank_sqlite/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../matchers/matchers.dart';
import '../mocks/mocks.dart';

void main() {
  testWidgets("Should save a contact", (WidgetTester tester) async {
    final mockContactDao = MockContactDao();
    final mockWebClient = MockTransactionWebClient();
    await tester.pumpWidget(MyApp(contactDao: mockContactDao, transactionWebClient: mockWebClient,));
    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    final transferFeatureItem = find.byWidgetPredicate((widget) =>
        featureItemMatcher(widget, "Transfer", Icons.monetization_on));

    expect(transferFeatureItem, findsOneWidget);
    await tester.tap(transferFeatureItem);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);

    verify(mockContactDao.findAll()).called(1);

    final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewContact, findsOneWidget);
    await tester.tap(fabNewContact);
    await tester.pumpAndSettle();

    final contactForm = find.byType(ContactForm);
    expect(contactForm, findsOneWidget);

    final nameTextField = find.byWidgetPredicate((widget) {
      return textFieldByLabelMatcher(widget, "Full name");
    });
    expect(nameTextField, findsOneWidget);
    await tester.enterText(nameTextField, "Tiago");

    final accountNumberTextField = find.byWidgetPredicate((widget) {
      return textFieldByLabelMatcher(widget, "Account number");
    });

    expect(accountNumberTextField, findsOneWidget);

    await tester.enterText(accountNumberTextField, "1000");

    final createButton = find.widgetWithText(ElevatedButton, "Create");
    expect(createButton, findsOneWidget);
    await tester.tap(createButton);
    await tester.pumpAndSettle();

    verify(mockContactDao.save(Contact(0, "tiago", 1000)));

    final contactsListBack = find.byType(ContactsList);
    expect(contactsListBack, findsOneWidget);

    verify(mockContactDao.findAll());
  });
}


