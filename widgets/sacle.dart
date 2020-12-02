import 'package:flutter/material.dart';

class newsacleTransaction extends StatefulWidget {
  Function transfaer;
  newsacleTransaction(this.transfaer);

  @override
  __newsacleTransactionState createState() => __newsacleTransactionState();
}

class __newsacleTransactionState extends State<newsacleTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.transfaer(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'coutit'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'sacle Amount'),
              controller: titleController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              //   height: 70,
              margin: EdgeInsets.all(100),
              //  color: Colors.blue,
              child: RaisedButton(
                child: Text('sale'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: () => submitData(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
