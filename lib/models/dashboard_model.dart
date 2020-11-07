import 'package:scoped_model/scoped_model.dart';

class Dashboard extends Model {
  int totalsales, booksold, revenue, reservations;

  Dashboard({this.totalsales, this.booksold, this.revenue, this.reservations});

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
      totalsales: json['totalsales'],
      booksold: json['booksold'],
      revenue: json['revenue'],
      reservations: json['reservations']);

  Map<String, dynamic> toJson() => {
        'totalsales': this.totalsales,
        'booksold': this.booksold,
        'revenue': this.revenue,
        'reservations': this.reservations
      };
}
