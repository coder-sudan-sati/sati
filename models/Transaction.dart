import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;
  bool sacle;
  double sacleAmount;
  int countatiOfSacle;
  int countati;
  Transaction({
    this.id,
    this.title,
    this.amount,
    this.countati,
    this.date,
    this.sacle,
    this.sacleAmount,
    this.countatiOfSacle,
  });
}
