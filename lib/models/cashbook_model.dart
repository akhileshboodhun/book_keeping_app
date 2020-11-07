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
  String description;
  int quantity;
  int amount;
  DateTime date;
  bool isReserved;

  Cashbook(
      {this.receipt_no,
      this.description,
      this.quantity,
      this.amount,
      this.date,
      this.isReserved});

  factory Cashbook.fromJson(Map<String, dynamic> json) => Cashbook(
      receipt_no: json['receipt_no'],
      description: json['description'],
      quantity: json['quantity'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      isReserved: json['isReserved']);

  Map<String, dynamic> toJson() => {
        'receipt_no': this.receipt_no,
        'description': this.description,
        'quantity': this.quantity,
        'amount': this.amount,
        'date': this.date.toIso8601String(),
        'isReserved': this.isReserved
      };
}
