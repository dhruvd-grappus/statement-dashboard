import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transactions_import/api_controller/excel_controller/excel_controller.dart';
import 'package:transactions_import/repositories/transactions_provider/transactions_provider.dart';

void main() {
  test(
    'Test To retrieve all Transaction data',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final data =
          await TransactionsProvider().getTransactions('assets/test_excel.xlsx');
      expect(data, isNotEmpty);
      debugPrint(data.toString());
    },
  );
}
