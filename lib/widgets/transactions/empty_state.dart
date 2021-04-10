import 'package:flutter/material.dart';

class EmptyTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 250),
          Container(
            height: 100,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 50),
          Text(
            'No transactions added yet :(',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
