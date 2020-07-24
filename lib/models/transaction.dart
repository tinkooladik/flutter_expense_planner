import 'package:flutter/foundation.dart';

class Transaction {
  final String id = DateTime.now().toString();
  final String title;
  final double amount;
  final DateTime date = DateTime.now();

  Transaction({
      @required this.title,
      @required this.amount});
}

List<Transaction> generateTransactions() {
  return [
    Transaction(
      title: "Cat's food",
      amount: 75.91,
    ),
    Transaction(
      title: "Clothes",
      amount: 23.57,
    ),
    Transaction(
      title: "Novus",
      amount: 12.37,
    ),
    Transaction(
      title: "Coffetel",
      amount: 35.72,
    ),
  ];
}
