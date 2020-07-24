import 'package:flutter/material.dart';

class InputsBlock extends StatelessWidget {
  final TextEditingController titleController;
  final Function(String) onAmountChange;
  final Function onButtonClick;

  InputsBlock({this.titleController, this.onAmountChange, this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Title",
                ),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Amount",
                ),
                onChanged: onAmountChange,
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 16),
                child: FlatButton(
                  color: Colors.green,
                  textColor: Colors.limeAccent,
                  child: Text("Add transaction"),
                  onPressed: onButtonClick,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
