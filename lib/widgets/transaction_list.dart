import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _transactions = generateTransactions();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _transactions.map((t) {
        return TransactionItem(transaction: t);
      }).toList(),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple,
                  width: 2,
                ),
                color: Colors.limeAccent,
              ),
              child: Text(
                "\$${transaction.amount}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transaction.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Text(
                      DateFormat.yMMMMEEEEd().add_jm().format(transaction.date),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
