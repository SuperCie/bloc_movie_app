import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_bloc2/models/Favoritemodels.dart';

// ignore: must_be_immutable
class Bmtile extends StatelessWidget {
  final Favorite favorite;
  Bmtile({super.key, required this.favorite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
        width: double.infinity,
        height: 200,
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  child: Image.network(
                    favorite.movie.poster!,
                    fit: BoxFit.cover,
                    height: 200,
                    width: 150,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         favorite. movie.title,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(favorite. movie.year, style: GoogleFonts.montserrat()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
