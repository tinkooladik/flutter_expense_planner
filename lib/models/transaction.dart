class Transaction {
  final String id = DateTime.now().toString();
  final String title;
  final double amount;
  DateTime date = DateTime.now();

  Transaction({this.title, this.amount});

  Transaction.forDate(this.title, this.amount, [this.date]);
}

List<Transaction> generateTransactions() {
  final now = DateTime.now();
  var transactions = [
    Transaction.forDate(
      "Clothes",
      93.57,
      now.subtract(Duration(days: 3)),
    ),
    Transaction.forDate(
      "Coffetel",
      35.72,
      now.subtract(Duration(days: 5)),
    ),
    Transaction.forDate(
      "Watch",
      30.54,
      now.subtract(Duration(days: 4)),
    ),
    Transaction.forDate(
      "Cat's food",
      75.91,
      now.subtract(Duration(days: 2)),
    ),
    Transaction.forDate(
      "Utility bills",
      80.72,
      now.subtract(Duration(days: 6)),
    ),
    Transaction.forDate(
      "Groceries",
      20.45,
      now.subtract(Duration(days: 1)),
    ),
    Transaction.forDate(
      "Novus",
      12.37,
      now.subtract(Duration(days: 4)),
    ),
  ];
  transactions.sort((a, b) => b.date.compareTo(a.date));
  return transactions;
}
