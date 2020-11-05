import 'package:scoped_model/scoped_model.dart';

// class Cashbook extends Model {
//   int receipt_no, salesCount, cashInHand;
//   String details, date;

//   Cashbook(
//       {this.receipt_no,
//       this.details,
//       this.salesCount,
//       this.cashInHand,
//       this.date});

//   factory Cashbook.fromJson(Map<String, dynamic> json) => Cashbook(
//       receipt_no: json['receipt_no'],
//       details: json['details'],
//       salesCount: json['salesCount'],
//       cashInHand: json['cashInHand'],
//       date: json['date']);

//   Map<String, dynamic> toJson() => {
//         'receipt_no': this.receipt_no,
//         'details': this.details,
//         'salesCount': this.salesCount,
//         'cashInHand': this.cashInHand,
//         'date': this.date
//       };
// }

class Cashbook extends Model {
  int receipt_no;
  DateTime date;
  String description;
  int quantity;
  double amount;

  Cashbook(
      {this.receipt_no,
      this.date,
      this.description,
      this.quantity,
      this.amount});

  factory Cashbook.fromJson(Map<String, dynamic> json) => Cashbook(
      receipt_no: json['receipt_no'],
      date: json['date'],
      description: json['description'],
      quantity: json['quantity'],
      amount: json['amount']);

  Map<String, dynamic> toJson() => {
        'receipt_no': this.receipt_no,
        'date': this.date,
        'description': this.description,
        'quantity': this.quantity,
        'amount': this.amount
      };
}
