import 'package:bytebank_sqlite/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/matchers.dart';
import '../mocks/mocks.dart';

void main() {
  testWidgets("Should display the main image when the dashboard is opened",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));

    final mainImage = find.byType(Image);

    expect(mainImage, findsOneWidget);
  });

  testWidgets("Should display the first feature when the dashboard is opened",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final firstFeature = find.byType(FeatureItem);
    expect(firstFeature, findsNWidgets(2));
  });

  testWidgets(
      "Should display the transfer feature when the dashboard is opened",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    // final  iconTransferFeatureIcon = find.widgetWithIcon(FeatureItem, Icons.monetization_on);
    // expect(iconTransferFeatureIcon, findsOneWidget);
    // final  nameTransferFeatureIcon = find.widgetWithText(FeatureItem, "Transfer");
    // expect(nameTransferFeatureIcon, findsOneWidget);

    final transferFeatureItem = find.byWidgetPredicate((widget) {
      return featureItemMatcher(widget, "Transfer", Icons.monetization_on);
    });
    expect(transferFeatureItem, findsOneWidget);
  });

  testWidgets(
      "Should display the transaction feed feature when the dashboard is opened",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final transactionFeatureItem = find.byWidgetPredicate((widget) {
      return featureItemMatcher(widget, "Transaction Feed", Icons.description);
    });
    expect(transactionFeatureItem, findsOneWidget);
  });
}
