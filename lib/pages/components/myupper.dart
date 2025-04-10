import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_bloc2/pages/home/profilescreen.dart';

class Upperhome extends StatelessWidget {
  const Upperhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey.shade800),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade900, blurRadius: 2),
              BoxShadow(color: Colors.white, blurRadius: 2),
            ],
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade800,
          ),
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Choose Cinema', style: GoogleFonts.montserrat()),
                  Text(
                    'XXV Pekanbaru',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              Icon(Icons.arrow_drop_down_outlined, size: 30),
            ],
          ),
        ),
        Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                border: Border.all(width: 1, color: Colors.grey.shade800),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade900, blurRadius: 2),
                  BoxShadow(color: Colors.white, blurRadius: 2),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.search),
              ),
            ),
            SizedBox(width: 10),
            Ink(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.teal.shade700,
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () => switchProfile(context),
                child: Image.asset(
                  'assets/images/avatar.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void switchProfile(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Profilescreen()),
  );
}
