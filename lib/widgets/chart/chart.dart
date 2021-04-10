import 'dart:math';

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
    }).reversed.toList();
  }

  double get _maxSpending {
    return _groupedTransactions
        .map((item) {
          return item['amount'];
        })
        .toList()
        .reduce((a, b) => max(a, b));
  }

  @override
  Widget build(BuildContext context) {
    print(_groupedTransactions.toString());
    return Container(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).primaryColorLight,
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _groupedTransactions.map((tr) {
              return Expanded(
                child: ChartBar(
                  tr['day'],
                  tr['amount'],
                  (tr['amount'] as double) / _maxSpending,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
