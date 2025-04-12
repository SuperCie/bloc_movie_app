import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_bloc2/bloc/export.dart';
import 'package:practice_bloc2/pages/ticket/ticketwidget.dart';

class Ticketpage extends StatefulWidget {
  const Ticketpage({super.key});

  @override
  State<Ticketpage> createState() => _TicketpageState();
}

class _TicketpageState extends State<Ticketpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Ticket',
          style: GoogleFonts.montserrat(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<TicketBloc, TicketState>(
          builder: (context, state) {
            if (state is TicketSuccess) {
              return ListView.builder(
                itemCount: state.ticket!.length,
                itemBuilder: (context, index) {
                  return Ticketwidget(ticketmodels: state.ticket![index]);
                },
              );
            } else {
              return Center(
                child: Text(
                  'No E-Tickets Found',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
