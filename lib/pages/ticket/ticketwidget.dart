import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice_bloc2/models/ticketmodels.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:ticket_clippers/ticket_clippers.dart';

class Ticketwidget extends StatelessWidget {
  final Ticketmodels ticketmodels;
  const Ticketwidget({super.key, required this.ticketmodels});

  @override
  Widget build(BuildContext context) {
    String formatBookingTime(DateTime dateTime) {
      return DateFormat('dd-MM-yyyy').format(dateTime); // Format: 13-04-2025
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TicketClipper(
        clipper: RoundedEdgeClipper(edge: Edge.horizontal),
        child: ClipRRect(
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 150,
                      child: TicketClipper(
                        clipper: RoundedEdgeClipper(edge: Edge.horizontal),
                        child: SizedBox(
                          child: Image.network(
                            ticketmodels.movie.poster!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formatBookingTime(ticketmodels.bookingTime),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              ticketmodels.movie.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '\$${ticketmodels.totalPrice.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red[300],
                              ),
                            ),
                            Text(
                              ticketmodels.seats.join(', '),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: BarcodeWidget(
                    data: ticketmodels.barcodeData,
                    barcode: Barcode.code128(),
                    width: double.infinity,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
