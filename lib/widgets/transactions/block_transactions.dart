import 'package:flutter/material.dart';

import './add_transaction.dart';
import './transaction_list.dart';
import '../../models/transaction.dart';

class TransactionsBlock extends StatefulWidget {
  @override
  _TransactionsBlockState createState() => _TransactionsBlockState();
}

class _TransactionsBlockState extends State<TransactionsBlock> {
  final List<Transaction> _transactions = generateTransactions();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTransaction(
          onAddTransactionClick:  _addTransaction,
        ),
        Divider(thickness: 1),
        TransactionList(
          transactions: _transactions,
        ),
      ],
    );
  }

  void _addTransaction(String title, double amount) {
    setState(() {
      _transactions.add(Transaction(title: title, amount: amount));
    });
  }
}
