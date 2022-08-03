import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class ExcelController {
  Future<List<Map<String, dynamic>>> getExcelCells(
      {dynamic file, String? filePath}) async {
    assert(file != null || filePath != null);
    
    var excel = filePath!=null
        ? await _getExcelBytesForAssetFile(filePath!)
        : Excel.decodeBytes(file?.bytes ?? File(filePath!).readAsBytesSync());

    if (excel.tables.keys.isEmpty) {
      return [];
    }
    if (excel.tables[excel.tables.keys.first]?.rows == null) {
      return [];
    }
    List<Map<String, dynamic>> transactions = [];
    final columns = getTransactionColumnNumbers(
      excel.tables[excel.tables.keys.first]!.rows.sublist(0, 21),
    );
    int startRowIndex = excel.tables[excel.tables.keys.first]!.rows.indexWhere(
        (element) =>
            element.any((data) => columnNames.keys.contains(data?.value)));

    for (var row in excel.tables[excel.tables.keys.first]!.rows
        .sublist(startRowIndex + 1)) {
      Map<String, dynamic> transaction = {};
      var dataRow = row;
      dataRow.remove(null);
      for (var data in dataRow) {
        if (data != null) {
          if (columns.containsKey(data.colIndex)) {
            transaction[columns[data.colIndex]] = data.value;
          }
        }
      }
      transactions.add(transaction);
    }
    return transactions;
  }

  Future<Excel> _getExcelBytesForAssetFile(String path) async {
    ByteData data = await rootBundle.load(path);

    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    return excel;
  }

  Map columnNames = {
    'Transaction Date': 'date',
    'Transaction Remarks': 'remarks',
    "Withdrawal Amount (INR )": 'withdrawalAmount',
    'Deposit Amount (INR )': 'depositAmount',
    'Balance (INR )': 'balanceAfter'
  };
  Map<int, dynamic> getTransactionColumnNumbers(List<List<Data?>> rows) {
    Map<int, String> columns = {};

    for (var row in rows) {
      for (var value in row) {
        if (value != null) {
          if (columnNames.keys.contains(value.value)) {
            columns[value.colIndex] = columnNames[value.value];
          }
        }
      }
    }
    return columns;
  }
}

class ColumnNumberMapping {
  String name;
  int col;
  ColumnNumberMapping(this.name, this.col);
}

    
    /* Your blah blah code here */
    
    
        