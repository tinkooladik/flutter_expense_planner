import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/models/transaction.dart';

import 'chart.dart';
import 'transactions/add_transaction.dart';
import 'transactions/transaction_list.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = generateTransactions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense planner"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddTransaction(context),
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(),
          Divider(thickness: 1),
          Expanded(
              child: TransactionList(
                transactions: _transactions,
              ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddTransaction(context),
      ),
    );
  }

  void _showAddTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (builderContext) {
      return AddTransaction(
        onAddTransactionClick: _addTransaction,
      );
    });
  }

  void _addTransaction(String title, double amount) {
    setState(() {
      _transactions.add(Transaction(title: title, amount: amount));
    });
  }
}