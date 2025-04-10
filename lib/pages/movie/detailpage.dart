import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_bloc2/models/moviemodels.dart';
import 'package:practice_bloc2/pages/components/mybutton.dart';
import 'package:practice_bloc2/pages/movie/seatpage.dart';

class Detailpage extends StatefulWidget {
  final Movie movie;
  const Detailpage({super.key, required this.movie});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    final String defaultDescription =
        "This description is a mock for the movie ${widget.movie.title}"
        "Used only for Flutter demo purposes";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          'Movie Detail',
          style: GoogleFonts.montserrat(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 1, color: Colors.grey.shade800),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade900, blurRadius: 2),
                    BoxShadow(color: Colors.white, blurRadius: 2),
                  ],
                ),
                height: 300,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(widget.movie.poster!, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movie.title,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      widget.movie.runtime,
                      style: GoogleFonts.montserrat(fontSize: 18),
                    ),
                    Text(
                      widget.movie.year,
                      style: GoogleFonts.montserrat(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                SizedBox(height: 10),
                Text(
                  'Description',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  defaultDescription,
                  style: GoogleFonts.montserrat(fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        children: [
          SizedBox(
            width: 100,
            child: Mybutton(
              ontap: () {},
              widget: Icon(CupertinoIcons.bookmark),
            ),
          ),
          Expanded(
            child: Mybutton(
              colorButton: Colors.teal.shade700,
              ontap: () => bookAction(context),
              widget: Text(
                'Book Ticket',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void bookAction(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Seatpage()));
}
