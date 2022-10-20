import 'package:flutter/material.dart';
import 'package:flutter_themoviedb/Theme/app_colors.dart';
import 'package:flutter_themoviedb/Theme/styles.dart';
import 'package:flutter_themoviedb/domain/clients/image_url_maker.dart';
import 'package:flutter_themoviedb/navigation/main_navigation.dart';
import 'package:flutter_themoviedb/widgets/movie_list/movie_list_cubit.dart';
import 'package:provider/provider.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context.read<MovieListCubit>().setupLocale(locale.toLanguageTag());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        _MovieListWidget(),
        _SearchMovieWidget(),
      ],
    );
  }
}

class _SearchMovieWidget extends StatelessWidget {
  const _SearchMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MovieListCubit>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        onChanged: cubit.searchMovie,
        decoration: InputDecoration(
          labelText: 'Search',
          filled: true,
          fillColor: Colors.white.withAlpha(235),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class _MovieListWidget extends StatelessWidget {
  const _MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieListCubit>();
    return ListView.builder(
        padding: const EdgeInsets.only(top: 70),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: cubit.state.movies.length,
        itemExtent: 170,
        itemBuilder: (BuildContext context, int index) {
          cubit.showedMovieAtIndex(index);
          return _MovieListRowWidget(index: index);
        });
  }
}

class _MovieListRowWidget extends StatelessWidget {
  final int index;

  const _MovieListRowWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MovieListCubit>();
    final movie = cubit.state.movies[index];
    final posterPath = movie.posterPath;
    final netImage = Image.network(ImageUrlMaker.imageUrl(posterPath),
        width: 95, errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
      return const SizedBox(
        width: 95,
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ),
      );
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.lightGrey,
                  offset: Offset(0, 2),
                  blurRadius: 5,
                  // spreadRadius: 1,
                )
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                if (posterPath.isNotEmpty) netImage,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: Styles.h2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          movie.releaseDate,
                          style: Styles.filmsDate,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          movie.overview,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.p14,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              splashColor: Colors.red.withOpacity(0.1),
              highlightColor: Colors.blue.withOpacity(0.1),
              onTap: () => _onMovieTap(context, movie.id),
            ),
          )
        ],
      ),
    );
  }

  // Widget onLoadImage(String posterPath) {
  //   try {
  //     final img =
  //     return img;
  //   } catch (e) {
  //     print(e);
  //     return CircularProgressIndicator();
  //   }
  // }

  void _onMovieTap(BuildContext context, int movieId) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: movieId,
    );
  }
}
