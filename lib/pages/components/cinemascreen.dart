import 'package:flutter/material.dart';

class CurvedScreenLine extends StatelessWidget {
  const CurvedScreenLine({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvedLinePainter(),
      size: Size(double.infinity, 100), // Tinggi garis
    );
  }
}

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.orange
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6;

    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height * 0.8);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
