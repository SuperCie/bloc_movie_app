import 'package:flutter/material.dart';

class SeatWidget extends StatelessWidget {
  final bool isBooked;
  final bool isSelected;
  final VoidCallback onTap;

   SeatWidget({
    required this.isBooked,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(Icons.chair),
      color:
          isBooked
              ? Colors.red[300]
              : isSelected
              ? Colors.teal
              : Colors.grey[300],
    );
  }
}
