import 'package:equatable/equatable.dart';
import 'package:practice_bloc2/models/moviemodels.dart';

class Favorite extends Equatable {
  final Movie movie;

  const Favorite({required this.movie});

  @override
  List<Object> get props => [movie];
}