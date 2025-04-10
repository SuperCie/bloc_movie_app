import 'package:equatable/equatable.dart';
import 'package:practice_bloc2/models/moviemodels.dart';
import '../export.dart';
import 'package:http/http.dart' as http;

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<getMovieEvent>((event, emit) async {
      emit(MovieLoading());
      final dataApi = await http.get(
        Uri.parse(
          'https://my-json-server.typicode.com/horizon-code-academy/fake-movies-api/movies',
        ),
      );
      // lakukan jika data fake API nya ada yang null untuk memfilter berapa yang mau diambil aja
      emit(
        MovieSuccess(
          movie:
              movieFromJson(dataApi.body)
                  .where(
                    (element) =>
                        element.poster != null && element.poster!.isNotEmpty,
                  )
                  .take(4)
                  .toList(),
        ),
      );
    });
  }
}
