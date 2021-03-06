import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/models/transaction.dart';

import 'chart/chart.dart';
import 'transactions/add_transaction.dart';
import 'transactions/empty_state.dart';
import 'transactions/transaction_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = generateTransactions();

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

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
      body: _transactions.isEmpty
          ? EmptyTransactions()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Chart(_recentTransactions),
                Divider(thickness: 1),
                Expanded(
                  child: TransactionList(
                    transactions: _transactions,
                    onDismissed: _removeTransaction,
                    onUndo: _undoRemoval,
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
    showModalBottomSheet(
        context: ctx,
        builder: (builderContext) {
          return AddTransaction(
            onAddTransactionClick: _addTransaction,
          );
        });
  }

  void _addTransaction(String title, double amount, DateTime date) {
    setState(() {
      _transactions.insert(0, Transaction(title, amount, date));
    });
  }

  void _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((item) {
        return item.id == id;
      });
    });
  }

  void _undoRemoval(Transaction transaction, int index) {
    setState(() {
      _transactions.insert(index, transaction);
    });
  }
}
