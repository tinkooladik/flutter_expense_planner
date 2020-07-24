import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/transactions/block_transactions.dart';

import 'widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: "Expense planner",
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Home page"),
          ),
          resizeToAvoidBottomPadding: true,
          body: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(),
          Divider(thickness: 1),
          TransactionsBlock(),
        ],
      ),
    );
  }
}
