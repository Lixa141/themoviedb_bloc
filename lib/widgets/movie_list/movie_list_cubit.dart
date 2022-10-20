import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_themoviedb/domain/blocs/movie_list_bloc.dart';
import 'package:flutter_themoviedb/domain/entity/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'movie_list_cubit.freezed.dart';

class MovieListRowData {
  final int id;
  final String posterPath;
  final String title;
  final String releaseDate;
  final String overview;

  MovieListRowData({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.overview,
  });
}

@freezed
class MovieListCubitState with _$MovieListCubitState {
  const factory MovieListCubitState({
    required List<MovieListRowData> movies,
    required String localeTag,
  }) = _MovieListCubitState;
}

class MovieListCubit extends Cubit<MovieListCubitState> {
  final MovieListBloc movieListBloc;
  late final StreamSubscription<MovieListState> movieListBlocSubscription;
  late DateFormat _dateFormat;
  Timer? searchDebounce;

  MovieListCubit(
    this.movieListBloc,
  ) : super(
          const MovieListCubitState(
            movies: <MovieListRowData>[],
            localeTag: '',
          ),
        ) {
    _onState(movieListBloc.state);
    movieListBlocSubscription = movieListBloc.stream.listen(_onState);
  }

  void _onState(MovieListState state) {
    final movies = state.movies.map(_makeRowData).toList();
    final newState = this.state.copyWith(movies: movies);
    emit(newState);
  }

  void setupLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    _dateFormat = DateFormat.yMMMMd(localeTag);
    movieListBloc.add(MovieListEventReset());
    movieListBloc.add(MovieListEventLoadNextPage(localeTag));
  }

  MovieListRowData _makeRowData(Movie movie) {
    final releaseDate = movie.releaseDate;
    final posterPath = movie.posterPath ?? '';
    final formatReleaseDate =
        releaseDate != null ? _dateFormat.format(releaseDate) : '';
    return MovieListRowData(
        id: movie.id,
        title: movie.title,
        releaseDate: formatReleaseDate,
        posterPath: posterPath,
        overview: movie.overview);
  }

  void showedMovieAtIndex(int index) {
    if (index < state.movies.length - 1) return;
    movieListBloc.add(MovieListEventLoadNextPage(state.localeTag));
  }

  void searchMovie(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () {
      movieListBloc.add(MovieListEventSearchMovie(text));
      movieListBloc.add(MovieListEventLoadNextPage(state.localeTag));
    });
  }

  @override
  Future<void> close() {
    movieListBlocSubscription.cancel();
    return super.close();
  }
}
