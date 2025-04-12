import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_bloc2/bloc/export.dart';
import 'package:practice_bloc2/models/moviemodels.dart';
import 'package:practice_bloc2/models/ticketmodels.dart';
import 'package:practice_bloc2/pages/components/cinemascreen.dart';
import 'package:practice_bloc2/pages/components/msgscaffold.dart';
import 'package:practice_bloc2/pages/seat/seatmanager.dart';
import 'package:practice_bloc2/pages/seat/seatwidget.dart';
import 'package:uuid/uuid.dart';

class Seatpage extends StatefulWidget {
  final Movie movie;
  const Seatpage({super.key, required this.movie});

  @override
  State<Seatpage> createState() => _SeatpageState();
}

class _SeatpageState extends State<Seatpage> {
  late final Seatmanager _seatManager;
  final double _pricePerSeat = 5.0;

  @override
  void initState() {
    super.initState();
    _seatManager = Seatmanager(bookedSeats: {'A1', 'B5'});
  }

  @override
  Widget build(BuildContext context) {
    final ticketCreate = context.read<TicketBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Seat',
          style: GoogleFonts.montserrat(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Screen',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            CurvedScreenLine(),
            SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 9,
                  // mainAxisExtent: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: _seatManager.allSeats.length,
                itemBuilder: (context, index) {
                  final seatId = _seatManager.allSeats[index];
                  return SeatWidget(
                    isBooked: _seatManager.isSeatBooked(seatId),
                    isSelected: _seatManager.isSeatSelected(seatId),
                    onTap: () {
                      print(_seatManager.selectedSeats);
                      setState(() {
                        _seatManager.selectSeat(seatId);
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Wrap(
                  children: [
                    Icon(Icons.chair, color: Colors.red[300]),
                    SizedBox(width: 10),
                    Text('No Available'),
                  ],
                ),
                Wrap(
                  children: [
                    Icon(Icons.chair, color: Colors.grey[300]),
                    SizedBox(width: 10),
                    Text('Available'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 200,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      '~ Selected Seats : ',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        _seatManager.selectedSeats.toString(),
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[300],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seat Price :',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '\$${_pricePerSeat.toStringAsFixed(0)}',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[300],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Payment :',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '\$${_seatManager.calculateTotal(_pricePerSeat).toStringAsFixed(0)}',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[300],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            BlocListener<TicketBloc, TicketState>(
              listener: (context, state) {
                if (state is TicketSuccess) {
                  msgScaffold(context, 'Ticket Purchased Successfully!');
                }
                if (state is TicketError) {
                  msgScaffold(context, state.message);
                }
              },
              child: GestureDetector(
                onTap: () {
                  if (_seatManager.selectedSeats.isEmpty) {
                    Text('Seats must be selected');
                  }
                  final barcodeData =
                      '${widget.movie.title}|${_seatManager.selectedSeats.join(',')}|${DateTime.now().millisecondsSinceEpoch}';

                  final ticket = Ticketmodels(
                    id: Uuid().v4(),
                    movie: widget.movie,
                    seats: _seatManager.selectedSeats.toList(),
                    totalPrice: _seatManager.calculateTotal(_pricePerSeat),
                    barcodeData: barcodeData,
                  );

                  ticketCreate.add(Addticket(ticket));

                  Navigator.of(context).pop();

                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade700,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Pay',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
