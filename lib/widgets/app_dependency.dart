import 'package:bytebank_sqlite/database/dao/contact_dao.dart';
import 'package:bytebank_sqlite/http/webclients/transaction_webclients.dart';
import 'package:flutter/cupertino.dart';

class AppDependencies extends InheritedWidget {
  final ContactDao contactDao;
  final TransactionWebClient transactionWebClient;

  AppDependencies(
      {required this.contactDao,
      required Widget child,
      required this.transactionWebClient})
      : super(child: child);

  static AppDependencies? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppDependencies>();
  }

  @override
  bool updateShouldNotify(AppDependencies oldWidget) {
    return contactDao != oldWidget.contactDao ||
        transactionWebClient != oldWidget.transactionWebClient;
  }
}
