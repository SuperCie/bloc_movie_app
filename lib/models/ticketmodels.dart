import 'package:intl/intl.dart';
import 'package:practice_bloc2/models/moviemodels.dart';

class Ticketmodels {
  final String id;
  final Movie movie;
  final List<String> seats;
  final double totalPrice;
  final DateTime bookingTime;
  final String barcodeData;

   Ticketmodels({
    required this.id,
    required this.movie,
    required this.seats,
    required this.totalPrice,
    DateTime? bookingTime,
    required this.barcodeData
  }) : bookingTime = bookingTime ?? DateTime.now();

  @override
  List<Object> get props => [id, movie, seats, totalPrice, bookingTime];
}
