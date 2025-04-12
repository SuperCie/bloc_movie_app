part of 'ticket_bloc.dart';

sealed class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

class Addticket extends TicketEvent{
  final Ticketmodels ticket;

 const Addticket(this.ticket);

  @override
  List<Object>get props => [ticket];
}