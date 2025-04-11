part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteUpdate extends FavoriteState {
  final List<Favorite> favorite;

  const FavoriteUpdate({required this.favorite});

  @override
  List<Object> get props => [favorite];
}
