import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final Function(String, double) onAddTransactionClick;

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  AddTransaction({this.onAddTransactionClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Title",
                ),
                controller: _titleController,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "Amount",
                ),
                controller: _amountController,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => submitData,
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 16),
                child: FlatButton(
                  color: Colors.green,
                  textColor: Colors.limeAccent,
                  child: Text("Add transaction"),
                  onPressed: () => submitData(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitData(BuildContext context) {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);

    if(title.isEmpty || amount <= 0) {
      return;
    }

    FocusScope.of(context).unfocus();
    onAddTransactionClick(
      title,
      amount,
    );
  }
}
