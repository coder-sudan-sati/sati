import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './sacle.dart';
import '../models/transaction.dart';
import '../models/k.dart';

class TransactionList extends StatelessWidget {
  final List transactions;
  TransactionList(this.transactions);
  final sacleController = TextEditingController();
  final List collecter = [];
  int d = 0;

  final coutatiController = TextEditingController();
  void sacle(int count, double sacleamount, String id) {
    for (int i = 0; i <= transactions.length; i++) {
      transactions[i].countati = count;
      transactions[i].sacleAmount = sacleamount;
    }
  }

  void sacleTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: newsacleTransaction(sacle),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'asset/images/sati.jpg',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('\$${transactions[index].amount}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Card(
                          child: FlatButton(
                              color: Colors.amber,
                              onPressed: () => sacleTransaction(context),
                              child: Text(
                                'Sale',
                                style: TextStyle(
                                    color: Colors.black,
                                    backgroundColor: Colors.amber),
                              )),
                        ),
                      )),
                );
              },
              itemCount: transactions.length,
            ),
    );
    d++;
  }
}
