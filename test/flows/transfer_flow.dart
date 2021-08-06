import 'dart:io';

import 'package:bytebank_sqlite/components/response_dialog.dart';
import 'package:bytebank_sqlite/components/transaction_auth_dialog.dart';
import 'package:bytebank_sqlite/main.dart';
import 'package:bytebank_sqlite/models/contact.dart';
import 'package:bytebank_sqlite/models/transaction.dart';
import 'package:bytebank_sqlite/screens/contacts_list.dart';
import 'package:bytebank_sqlite/screens/dashboard.dart';
import 'package:bytebank_sqlite/screens/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

import '../matchers/matchers.dart';
import '../mocks/mocks.dart';
import 'actions.dart';

void main() {
  testWidgets("Transfer to a contact", (WidgetTester tester) async {
    final mockContactDao = MockContactDao();
    final mockWebClient = MockTransactionWebClient();
    await tester.pumpWidget(MyApp(
      contactDao: mockContactDao,
      transactionWebClient: mockWebClient,
    ));

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);
    final contact = Contact(0, "Alex", 1000);
    when(mockContactDao.findAll()).thenAnswer((realInvocation) async {
      debugPrint("name invocation ${realInvocation.memberName}");

      return [contact];
    });

    await clickOnTheTransferFeatureItem(tester);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);

    verify(mockContactDao.findAll()).called(1);

    final contactItem = find.byWidgetPredicate((widget) {
      if (widget is ContactItem) {
        return widget.contact.name == "Alex" &&
            widget.contact.accountNumber == 1000;
      }
      return false;
    });

    expect(contactItem, findsOneWidget);
    await tester.tap(contactItem);
    await tester.pumpAndSettle();

    final transactionForm = find.byType(TransactionForm);
    expect(transactionForm, findsOneWidget);

    final contactName = find.text("Alex");
    expect(contactName, findsOneWidget);
    final contactAccountNUmber = find.text("1000");
    expect(contactAccountNUmber, findsOneWidget);

    final textFieldValue = find.byWidgetPredicate((widget) {
      return textFieldByLabelTextMatcher(widget, "Value");
    });
    expect(textFieldValue, findsOneWidget);

    await tester.enterText(textFieldValue, "200");

    final transferButon = find.widgetWithText(ElevatedButton, "Transfer");
    expect(transferButon, findsOneWidget);
    await tester.tap(transferButon);
    await tester.pumpAndSettle();

    final transactionAuthDialog = find.byType(TransactionAuthDialog);
    expect(transactionAuthDialog, findsOneWidget);

    final textFieldSenha =
    find.byKey(transactionAuthDialogTextFieldPasswordKey);
    expect(textFieldSenha, findsOneWidget);
    await tester.enterText(textFieldSenha, "1000");

    final cancelButton = find.widgetWithText(ElevatedButton, "Cancel");
    expect(cancelButton, findsOneWidget);
    final confirmButton = find.widgetWithText(ElevatedButton, "Confirm");
    expect(confirmButton, findsOneWidget);

    when(mockWebClient.save(Transaction(200, contact, null), "1000"))
        .thenAnswer((_) async => Transaction(200, contact, null));

    await tester.tap(confirmButton);
    await tester.pumpAndSettle();

    final successDialog = find.byType(SuccessDialog);

    expect(successDialog, findsOneWidget);
    
    final okButton = find.widgetWithText(ElevatedButton, "Ok");
    expect(okButton, findsOneWidget);
    await tester.pumpAndSettle();
     
    final contactsListBack = find.byType(ContactsList);
    expect(contactsListBack, findsOneWidget);

  });
}
