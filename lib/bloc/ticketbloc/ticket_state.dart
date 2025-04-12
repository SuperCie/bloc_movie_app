part of 'ticket_bloc.dart';

sealed class TicketState extends Equatable {
  const TicketState();
  
  @override
  List<Object> get props => [];
}

final class TicketInitial extends TicketState {}

class TicketLoading extends TicketState {

}

class TicketSuccess extends TicketState{
  final List<Ticketmodels>? ticket;

  const TicketSuccess({this.ticket});
}

class TicketError extends TicketState{
   final String message;

  const TicketError(this.message);

  @override
  List<Object> get props => [message];
}