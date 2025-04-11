// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<Movie> movieFromJson(String str) =>
    List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie  extends Equatable{
  final String title;
  final String year;
  final String runtime;
  final String? poster; // karena data API ada yang kosong

  Movie({
    required this.title,
    required this.year,
    required this.runtime,
    this.poster,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    title: json["Title"],
    year: json["Year"],
    runtime: json["Runtime"],
    poster: json["Poster"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Year": year,
    "Runtime": runtime,
    "Poster": poster,
  };

  @override
  List<Object?> get props => [title, year, runtime, poster];
}
