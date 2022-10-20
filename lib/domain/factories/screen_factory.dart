import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_themoviedb/domain/blocs/auth_bloc.dart';
import 'package:flutter_themoviedb/domain/blocs/movie_list_bloc.dart';
import 'package:flutter_themoviedb/widgets/auth/auth.dart';
import 'package:flutter_themoviedb/widgets/auth/auth_view_cubit.dart';
import 'package:flutter_themoviedb/widgets/loader/loader.dart';
import 'package:flutter_themoviedb/widgets/loader/loader_view_cubit.dart';
import 'package:flutter_themoviedb/widgets/main_screen/main_screen.dart';
import 'package:flutter_themoviedb/widgets/movie_details/movie_details.dart';
import 'package:flutter_themoviedb/widgets/movie_details/movie_details_model.dart';
import 'package:flutter_themoviedb/widgets/movie_list/movie_list.dart';
import 'package:flutter_themoviedb/widgets/movie_list/movie_list_cubit.dart';
import 'package:flutter_themoviedb/widgets/movie_trailer/movie_trailer.dart';
import 'package:flutter_themoviedb/widgets/news/news.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  AuthBloc? _authBloc;
  MovieListBloc? _movieListBloc;

  Widget makeLoader() {
    final authBloc =
        _authBloc ?? AuthBloc(const AuthCheckStatusInProgressState());
    _authBloc = authBloc;

    return BlocProvider<LoaderViewCubit>(
      create: (_) => LoaderViewCubit(
        LoaderViewCubitState.unknown,
        authBloc,
      ),
      //LoaderViewModel(context),
      // lazy: false,
      child: const LoaderWidget(),
    );
  }

  Widget makeAuth() {
    final authBloc =
        _authBloc ?? AuthBloc(const AuthCheckStatusInProgressState());
    _authBloc = authBloc;

    return BlocProvider<AuthViewCubit>(
      create: (_) => AuthViewCubit(
        const AuthViewCubitFormFillingState(),
        authBloc,
      ),
      child: const AuthWidget(),
    );
  }

  Widget makeMainScreen() {
    _authBloc?.close();
    _authBloc = null;
    return const MainScreenWidget();
  }

  Widget makeMovieDetails(int movieId) {
    return ChangeNotifierProvider(
      create: (_) => MovieDetailsModel(movieId),
      child: const MovieDetailsWidget(),
    );
  }

  Widget makeMovieTrailer(String videoKey) {
    return MovieTrailer(videoKey: videoKey);
  }

  Widget makeMovieList() {
    final movieListBloc =
        _movieListBloc ?? MovieListBloc(const MovieListState.initial());
    _movieListBloc = movieListBloc;

    return BlocProvider<MovieListCubit>(
      create: (_) => MovieListCubit(movieListBloc),
      child: const MovieList(),
    );
  }

  Widget makeNews() {
    return const News();
  }
}
