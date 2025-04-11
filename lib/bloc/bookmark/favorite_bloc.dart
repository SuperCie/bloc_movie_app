import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_bloc2/models/Favoritemodels.dart';
import 'package:practice_bloc2/models/moviemodels.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<ToggleBookmark>(_onToggleBookmark);
  }

  void _onToggleBookmark(ToggleBookmark event, Emitter<FavoriteState> emit) {
    final currentBookmarks =
        state is FavoriteUpdate
            ? (state as FavoriteUpdate).favorite
            : <Favorite>[];

    final index = currentBookmarks.indexWhere((b) => b.movie == event.movie);
    final newFavorite = List<Favorite>.from(currentBookmarks);

    index != -1
        ? newFavorite.removeAt(index)
        : newFavorite.add(Favorite(movie: event.movie));

    emit(FavoriteUpdate(favorite: newFavorite));
  }
}
