import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_bloc2/bloc/export.dart';
import 'package:practice_bloc2/pages/components/bmtile.dart';

class Favoritepage extends StatefulWidget {
  const Favoritepage({super.key});

  @override
  State<Favoritepage> createState() => _FavoritepageState();
}

class _FavoritepageState extends State<Favoritepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bookmark Movie's",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteUpdate) {
              return ListView.builder(
                itemCount: state.favorite.length,
                itemBuilder: (context, index) {
                  return Bmtile(favorite: state.favorite[index]);
                },
              );
            }
            if (state.props.isEmpty) {
              return Center(child: Text('No Bookmarks Data'));
            }
            return Center(child: Text('No Bookmarks Data'));
          },
        ),
      ),
    );
  }
}
