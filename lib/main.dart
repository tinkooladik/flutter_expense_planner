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
            accentColor: Colors.purple,
            fontFamily: 'Quicksand',
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  button: TextStyle(
                    color: Colors.white,
                  ),
                ),
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
            ),
          ),
          home: HomePage()),
    );
  }
}
