

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void msgScaffold(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text,style: GoogleFonts.montserrat(fontSize: 20),)));
}