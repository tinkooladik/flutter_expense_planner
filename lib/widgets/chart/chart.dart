import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../extensions/date.dart';
import '../../models/transaction.dart';
import '../../widgets/chart/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _transactions;

  Chart(this._transactions);

  List<Map<String, Object>> get _groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var total = 0.0;

      _transactions.forEach((transaction) {
        if (transaction.date.isSameDate(weekDay)) {
          total += transaction.amount;
        }
      });
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': total,
      };
    });
  }

  double get _totalSpending {
    return _groupedTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_groupedTransactions.toString());
    return Container(
      width: double.infinity,
      child: Card(
        color: Colors.greenAccent,
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: _groupedTransactions.map((tr) {
            return ChartBar(
              tr['day'],
              tr['amount'],
              (tr['amount'] as double) / _totalSpending,
            );
          }).toList(),
        ),
      ),
    );
  }
}
