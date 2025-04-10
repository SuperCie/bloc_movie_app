import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Data',
          style: GoogleFonts.montserrat(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          CircleAvatar(
            radius: 150,
            backgroundColor: Colors.teal.shade700,
            child: Image.asset('assets/images/avatar.png'),
          ),
          SizedBox(height: 30),
          Center(
            child: Column(
              children: [
                Text(
                  'Charles Putra',
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text('~', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text(
                  '01 January 2002',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
