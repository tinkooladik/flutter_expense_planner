import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../extensions/date.dart';

class AddTransaction extends StatefulWidget {
  final Function(String, double, DateTime) onAddTransactionClick;

  AddTransaction({this.onAddTransactionClick});

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _date = DateTime.now();

  String get _dateLabel {
    if (_date.isSameDate(DateTime.now())) {
      return 'Today';
    } else {
      return DateFormat.yMMMd().format(_date);
    }
  }

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
            horizontal: 20,
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Picked date: $_dateLabel',
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).accentColor,
                      child: Text(
                        'Chose Another Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _showDatePicker,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 30),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  textColor: Theme.of(context).textTheme.button.color,
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

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.onAddTransactionClick(
      title,
      amount,
      _date,
    );

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date != null) {
        setState(() {
          _date = date;
        });
      }
    });
  }
}
