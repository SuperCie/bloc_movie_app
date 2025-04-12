import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_bloc2/bloc/export.dart';
import 'package:practice_bloc2/pages/components/mytile.dart';
import 'package:practice_bloc2/pages/components/myupper.dart';
import 'package:practice_bloc2/pages/components/myytplayer.dart';
import 'package:practice_bloc2/pages/home/detailpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            //upper UI
            Upperhome(),
            // playing movie
            SizedBox(height: 20),
            Myytplayer(),
            // movie list
            SizedBox(height: 20),
            Text(
              'Movie List',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            BlocBuilder(
              bloc: MovieBloc()..add(getMovieEvent()),
              builder: (context, state) {
                if (state is MovieLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is MovieSuccess) {
                  return SizedBox(
                    height: 300,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.movie.length,
                      itemBuilder: (context, index) {
                        return Mytile(
                          movie: state.movie[index],
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        Detailpage(movie: state.movie[index]),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      'No Movie Today',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
