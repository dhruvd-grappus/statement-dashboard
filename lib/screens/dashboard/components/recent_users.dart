import 'package:provider/provider.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/utils/colorful_tag.dart';
import 'package:smart_admin_dashboard/models/recent_user_model.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:transactions_import/repositories/models/transaction.dart';
import 'package:transactions_import/repositories/transactions_provider/transactions_provider.dart';

class Transactions extends StatelessWidget {
  const Transactions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Consumer<TransactionsProvider>(
        builder: (context, transactions, _) {
          return SizedBox(
            width: double.infinity,
            child: DataTable(
            
              horizontalMargin: 0,
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Withdrawal"),
                ),
                DataColumn(
                  label: Text("Deposit"),
                ),
                DataColumn(
                  label: Text("Remarks"),
                ),
              ],
              rows: List.generate(
                20,
                (index) => recentUserDataRow(
                    transactions.transactions[index], context),
              ),
            ),
          );
        },
      ),
    );
  }
}

DataRow recentUserDataRow(Transaction transaction, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            transaction.date.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            transaction.withdrawalAmount.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            transaction.depositAmount.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            transaction.remarks.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ],
  );
}
