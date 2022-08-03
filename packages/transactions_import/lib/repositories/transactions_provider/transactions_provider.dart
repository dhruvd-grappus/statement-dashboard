import 'package:flutter/cupertino.dart';
import '../../api_controller/excel_controller/excel_controller.dart';
import '../../repositories/models/transaction.dart';

enum Status {
  initial,
  loading,
  done,
  error,
}

class TransactionsProvider extends ChangeNotifier {
  List<Transaction> transactions = [];
  Status status = Status.initial;
  Future<List<Transaction>> getTransactions(String path) async {
    status = Status.loading;
    notifyListeners();
    List<Map<String, dynamic>> data =
        await ExcelController().getExcelCells(path, true);

    var list = data.map((e) => Transaction.fromMap(e)).toList();
    transactions = list;
    status = Status.done;
    notifyListeners();
    return list;
  }
}
