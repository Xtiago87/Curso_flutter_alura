import 'package:bytebank_sqlite/database/dao/contact_dao.dart';
import 'package:bytebank_sqlite/http/webclients/transaction_webclients.dart';
import 'package:mockito/mockito.dart';

class MockContactDao extends Mock implements ContactDao {
}

class MockTransactionWebClient extends Mock implements TransactionWebClient {
}