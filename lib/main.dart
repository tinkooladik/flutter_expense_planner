import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/home_page.dart';

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
          home: HomePage()),
    );
  }
}
