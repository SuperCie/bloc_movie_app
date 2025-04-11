class Seatmanager {
  final List<String> _allSeats;
  final Set<String> _selectedSeats = {};
  final Set<String>? bookedSeats; // Optional: kursi yang sudah dipesan

  Seatmanager({int rows = 6, int seatsPerRow = 9, this.bookedSeats})
    : _allSeats = _generateSeatIds(rows, seatsPerRow);

  static List<String> _generateSeatIds(int rows, int seatsPerRow) {
    final List<String> seats = [];
    for (int i = 0; i <= rows; i++) {
      final row = String.fromCharCode(65 + i);
      for (int seatNum = 1; seatNum <= seatsPerRow; seatNum++) {
        seats.add('$row$seatNum');
      }
    }
    return seats;
  }

  void selectSeat(String seatId) {
    if (bookedSeats?.contains(seatId) ?? false) return;
    _selectedSeats.contains(seatId)
        ? _selectedSeats.remove(seatId)
        : _selectedSeats.add(seatId);
  }

  //getter
  List<String> get allSeats => _allSeats;
  Set<String> get selectedSeats => _selectedSeats;
  bool isSeatBooked(String seatId) => bookedSeats?.contains(seatId) ?? false;

  bool isSeatSelected(String seatId) => _selectedSeats.contains(seatId);

  // Hitung total harga
  double calculateTotal(double pricePerSeat) =>
      _selectedSeats.length * pricePerSeat;
}
