import 'package:bytebank_sqlite/models/contact.dart';
import 'package:bytebank_sqlite/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("should return the value when create a transaction", () {
    final transaction = Transaction(200, Contact(1, "", 2), "");
    expect(transaction.value, 200);
  });
  test("should show error when create transaction with value less than 0", () {
    expect(() => Transaction(0, Contact(1, "", 2), ""), throwsAssertionError);
  });
}
