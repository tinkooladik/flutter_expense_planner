import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}

List<Transaction> generateTransactions() {
  return [
    Transaction(
      id: "t1",
      title: "Cat's food",
      amount: 75.91,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Clothes",
      amount: 23.57,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t3",
      title: "Novus",
      amount: 12.37,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t4",
      title: "Coffetel",
      amount: 35.72,
      date: DateTime.now(),
    ),
  ];
}
