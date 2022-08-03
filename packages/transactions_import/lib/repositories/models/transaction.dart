// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String date;
  final String remarks;
  final double withdrawalAmount;
  final double depositAmount;

  final double balanceAfter;
  const Transaction({
    this.date = '',
    this.remarks = '',
    this.withdrawalAmount = 0.0,
    this.depositAmount = 0.0,
    this.balanceAfter = 0.0,
  });

  Transaction copyWith({
    String? date,
    String? remarks,
    double? withdrawalAmount,
    double? depositAmount,
    double? balanceAfter,
  }) {
    return Transaction(
      date: date ?? this.date,
      remarks: remarks ?? this.remarks,
      withdrawalAmount: withdrawalAmount ?? this.withdrawalAmount,
      depositAmount: depositAmount ?? this.depositAmount,
      balanceAfter: balanceAfter ?? this.balanceAfter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'remarks': remarks,
      'withdrawalAmount': withdrawalAmount,
      'depositAmount': depositAmount,
      'balanceAfter': balanceAfter,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      date: (map['date'] ?? '') as String,
      remarks: (map['remarks'] ?? '') as String,
      withdrawalAmount: (map['withdrawalAmount'] ?? 0.0).toDouble(),
      depositAmount: (map['depositAmount'] ?? 0.0).toDouble(),
      balanceAfter: (map['balanceAfter'] ?? 0.0).toDouble(),
    );
  }

  @override
  List<Object> get props {
    return [
      date,
      remarks,
      withdrawalAmount,
      depositAmount,
      balanceAfter,
    ];
  }
}
