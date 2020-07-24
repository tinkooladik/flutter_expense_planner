import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';
import 'widgets/inputs_block.dart';
import 'widgets/transaction_list.dart';

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
  final List<Transaction> transactions = generateTransactions();

  final titleInput = TextEditingController();
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(),
          Divider(thickness: 1),
          InputsBlock(
            titleController: titleInput,
            onAmountChange: (s) => amountInput = s,
            onButtonClick: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content:
                    Text("title: ${titleInput.text}, amount: $amountInput"),
              ));
            },
          ),
          Divider(thickness: 1),
          TransactionList(),
        ],
      ),
    );
  }
}
