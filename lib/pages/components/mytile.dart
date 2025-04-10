import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_bloc2/models/moviemodels.dart';

class Mytile extends StatelessWidget {
  final Movie movie;
  void Function()? ontap;
  Mytile({super.key, required this.movie, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 1, color: Colors.grey.shade800),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade900, blurRadius: 2),
              BoxShadow(color: Colors.white, blurRadius: 2),
            ],
          ),
          width: 200,
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: Image.network(
                  movie.poster!,
                  fit: BoxFit.cover,
                  height: 190,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(movie.year, style: GoogleFonts.montserrat()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
