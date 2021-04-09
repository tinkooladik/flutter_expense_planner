import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function(String, double) onAddTransactionClick;

  AddTransaction({this.onAddTransactionClick});

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

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
                onSubmitted: (_) => _submitData,
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 16),
                child: FlatButton(
                  color: Colors.green,
                  textColor: Colors.limeAccent,
                  child: Text("Add transaction"),
                  onPressed: _submitData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitData() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);

    if(title.isEmpty || amount <= 0) {
      return;
    }

    widget.onAddTransactionClick(
      title,
      amount,
    );

    Navigator.of(context).pop();
  }
}
