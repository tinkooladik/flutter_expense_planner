class Transaction {
  final String id = DateTime.now().toString();
  final String title;
  final double amount;
  DateTime date = DateTime.now();

  Transaction(this.title, this.amount, [this.date]);

  Transaction.today({this.title, this.amount});
}

List<Transaction> generateTransactions() {
  final now = DateTime.now();
  var transactions = [
    Transaction(
      "Clothes",
      93.57,
      now.subtract(Duration(days: 3)),
    ),
    Transaction(
      "Coffetel",
      35.72,
      now.subtract(Duration(days: 5)),
    ),
    Transaction(
      "Watch",
      30.54,
      now.subtract(Duration(days: 4)),
    ),
    Transaction(
      "Cat's food",
      75.91,
      now.subtract(Duration(days: 2)),
    ),
    Transaction(
      "Utility bills",
      80.72,
      now.subtract(Duration(days: 6)),
    ),
    Transaction(
      "Groceries",
      20.45,
      now.subtract(Duration(days: 1)),
    ),
    Transaction(
      "Novus",
      12.37,
      now.subtract(Duration(days: 4)),
    ),
  ];
  transactions.sort((a, b) => b.date.compareTo(a.date));
  return transactions;
}
