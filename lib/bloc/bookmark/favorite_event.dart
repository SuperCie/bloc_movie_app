part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class ToggleBookmark extends FavoriteEvent{
  final Movie movie;

const ToggleBookmark({required this.movie});

 @override
 List<Object> get props => [movie];
}
