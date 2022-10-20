import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_themoviedb/configuration/configuration.dart';
import 'package:flutter_themoviedb/domain/clients/movie_api_client.dart';
import 'package:flutter_themoviedb/domain/entity/movie.dart';
import 'package:flutter_themoviedb/domain/entity/popular_movie_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_list_bloc.freezed.dart';

abstract class MovieListEvent {}

class MovieListEventLoadNextPage extends MovieListEvent {
  final String locale;

  MovieListEventLoadNextPage(this.locale);
}

class MovieListEventReset extends MovieListEvent {}

class MovieListEventSearchMovie extends MovieListEvent {
  final String query;

  MovieListEventSearchMovie(this.query);
}

extension MovieListContainerExtension on MovieListContainer {
  bool get isComplete => currentPage >= totalPage;
}

@freezed
class MovieListContainer with _$MovieListContainer {
  const factory MovieListContainer.initial({
    @Default(<Movie>[]) List<Movie> movies,
    @Default(0) int currentPage,
    @Default(1) int totalPage,
  }) = _MovieListContainerInitial;

  const factory MovieListContainer({
    required List<Movie> movies,
    required int currentPage,
    required int totalPage,
  }) = _MovieListContainer;
}

class MovieListState {
  final MovieListContainer popularMovieContainer;
  final MovieListContainer searchMovieContainer;
  final String searchQuery;

  bool get isSearchMode => searchQuery.isNotEmpty;

  List<Movie> get movies =>
      isSearchMode ? searchMovieContainer.movies : popularMovieContainer.movies;

  const MovieListState.initial()
      : popularMovieContainer = const MovieListContainer.initial(),
        searchMovieContainer = const MovieListContainer.initial(),
        searchQuery = '';

  MovieListState({
    required this.popularMovieContainer,
    required this.searchMovieContainer,
    required this.searchQuery,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieListState &&
          runtimeType == other.runtimeType &&
          popularMovieContainer == other.popularMovieContainer &&
          searchMovieContainer == other.searchMovieContainer &&
          searchQuery == other.searchQuery;

  @override
  int get hashCode =>
      popularMovieContainer.hashCode ^
      searchMovieContainer.hashCode ^
      searchQuery.hashCode;

  MovieListState copyWith({
    MovieListContainer? popularMovieContainer,
    MovieListContainer? searchMovieContainer,
    String? searchQuery,
  }) {
    return MovieListState(
      popularMovieContainer:
          popularMovieContainer ?? this.popularMovieContainer,
      searchMovieContainer: searchMovieContainer ?? this.searchMovieContainer,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

typedef NextPageLoader = Future<PopularMovieResponse> Function(int);

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final _movieApiClient = MovieApiClient();

  MovieListBloc(MovieListState initialState) : super(initialState) {
    on<MovieListEvent>((event, emit) async {
      if (event is MovieListEventLoadNextPage) {
        await onMovieListLoadNextPageEvent(event, emit);
      } else if (event is MovieListEventReset) {
        await onMovieListResetEvent(event, emit);
      } else if (event is MovieListEventSearchMovie) {
        await onMovieListSearchMovieEvent(event, emit);
      }
    }, transformer: sequential());
  }

  Future<void> onMovieListLoadNextPageEvent(
    MovieListEventLoadNextPage event,
    Emitter<MovieListState> emit,
  ) async {
    if (state.isSearchMode) {
      final container =
          await _loadNextPage(state.searchMovieContainer, (nextPage) async {
        final result = _movieApiClient.searchMovies(
          state.searchQuery,
          nextPage,
          event.locale,
          Configuration.apiKey,
        );
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(searchMovieContainer: container);
        emit(newState);
      }
    } else {
      final container =
          await _loadNextPage(state.popularMovieContainer, (nextPage) async {
        final result = await _movieApiClient.popularMovies(
          nextPage,
          event.locale,
          Configuration.apiKey,
        );
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(popularMovieContainer: container);
        emit(newState);
      }
    }
  }

  Future<MovieListContainer?> _loadNextPage(
    MovieListContainer container,
    NextPageLoader loader,
  ) async {
    if (container.isComplete) return null;
    final nextPage = container.currentPage + 1;
    final result = await loader(nextPage);
    var movies = List<Movie>.from(container.movies);
    movies.addAll(result.movies);
    final newContainer = container.copyWith(
      movies: movies,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    return newContainer;
  }

  Future<void> onMovieListResetEvent(
    MovieListEventReset event,
    Emitter<MovieListState> emit,
  ) async {
    emit(const MovieListState.initial());
  }

  Future<void> onMovieListSearchMovieEvent(
    MovieListEventSearchMovie event,
    Emitter<MovieListState> emit,
  ) async {
    if (state.searchQuery == event.query) return;
    final newState = state.copyWith(
      searchQuery: event.query,
      searchMovieContainer: const MovieListContainer.initial(),
    );
    emit(newState);
  }
}
