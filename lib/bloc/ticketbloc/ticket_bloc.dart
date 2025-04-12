import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_bloc2/models/ticketmodels.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketInitial()) {
    List<Ticketmodels> _tickets = [];


    on<Addticket>((event, emit) async {
      
      emit(TicketLoading());
      try {
        await Future.delayed(Duration(milliseconds: 500));
        _tickets.add(event.ticket);
        emit(TicketSuccess(ticket: _tickets));
      } catch (e) {
        emit(TicketError('Failed to add ticket: ${e.toString()}'));
      }
    });
  }
}


