// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieListContainer {
  List<Movie> get movies => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Movie> movies, int currentPage, int totalPage)
        $default, {
    required TResult Function(
            List<Movie> movies, int currentPage, int totalPage)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<Movie> movies, int currentPage, int totalPage)?
        $default, {
    TResult Function(List<Movie> movies, int currentPage, int totalPage)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Movie> movies, int currentPage, int totalPage)?
        $default, {
    TResult Function(List<Movie> movies, int currentPage, int totalPage)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MovieListContainer value) $default, {
    required TResult Function(_MovieListContainerInitial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_MovieListContainer value)? $default, {
    TResult Function(_MovieListContainerInitial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MovieListContainer value)? $default, {
    TResult Function(_MovieListContainerInitial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieListContainerCopyWith<MovieListContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListContainerCopyWith<$Res> {
  factory $MovieListContainerCopyWith(
          MovieListContainer value, $Res Function(MovieListContainer) then) =
      _$MovieListContainerCopyWithImpl<$Res>;
  $Res call({List<Movie> movies, int currentPage, int totalPage});
}

/// @nodoc
class _$MovieListContainerCopyWithImpl<$Res>
    implements $MovieListContainerCopyWith<$Res> {
  _$MovieListContainerCopyWithImpl(this._value, this._then);

  final MovieListContainer _value;
  // ignore: unused_field
  final $Res Function(MovieListContainer) _then;

  @override
  $Res call({
    Object? movies = freezed,
    Object? currentPage = freezed,
    Object? totalPage = freezed,
  }) {
    return _then(_value.copyWith(
      movies: movies == freezed
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: totalPage == freezed
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieListContainerInitialCopyWith<$Res>
    implements $MovieListContainerCopyWith<$Res> {
  factory _$$_MovieListContainerInitialCopyWith(
          _$_MovieListContainerInitial value,
          $Res Function(_$_MovieListContainerInitial) then) =
      __$$_MovieListContainerInitialCopyWithImpl<$Res>;
  @override
  $Res call({List<Movie> movies, int currentPage, int totalPage});
}

/// @nodoc
class __$$_MovieListContainerInitialCopyWithImpl<$Res>
    extends _$MovieListContainerCopyWithImpl<$Res>
    implements _$$_MovieListContainerInitialCopyWith<$Res> {
  __$$_MovieListContainerInitialCopyWithImpl(
      _$_MovieListContainerInitial _value,
      $Res Function(_$_MovieListContainerInitial) _then)
      : super(_value, (v) => _then(v as _$_MovieListContainerInitial));

  @override
  _$_MovieListContainerInitial get _value =>
      super._value as _$_MovieListContainerInitial;

  @override
  $Res call({
    Object? movies = freezed,
    Object? currentPage = freezed,
    Object? totalPage = freezed,
  }) {
    return _then(_$_MovieListContainerInitial(
      movies: movies == freezed
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: totalPage == freezed
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MovieListContainerInitial implements _MovieListContainerInitial {
  const _$_MovieListContainerInitial(
      {final List<Movie> movies = const <Movie>[],
      this.currentPage = 0,
      this.totalPage = 1})
      : _movies = movies;

  final List<Movie> _movies;
  @override
  @JsonKey()
  List<Movie> get movies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int totalPage;

  @override
  String toString() {
    return 'MovieListContainer.initial(movies: $movies, currentPage: $currentPage, totalPage: $totalPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieListContainerInitial &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality().equals(other.totalPage, totalPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalPage));

  @JsonKey(ignore: true)
  @override
  _$$_MovieListContainerInitialCopyWith<_$_MovieListContainerInitial>
      get copyWith => __$$_MovieListContainerInitialCopyWithImpl<
          _$_MovieListContainerInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Movie> movies, int currentPage, int totalPage)
        $default, {
    required TResult Function(
            List<Movie> movies, int currentPage, int totalPage)
        initial,
  }) {
    return initial(movies, currentPage, totalPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<Movie> movies, int currentPage, int totalPage)?
        $default, {
    TResult Function(List<Movie> movies, int currentPage, int totalPage)?
        initial,
  }) {
    return initial?.call(movies, currentPage, totalPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Movie> movies, int currentPage, int totalPage)?
        $default, {
    TResult Function(List<Movie> movies, int currentPage, int totalPage)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(movies, currentPage, totalPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MovieListContainer value) $default, {
    required TResult Function(_MovieListContainerInitial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_MovieListContainer value)? $default, {
    TResult Function(_MovieListContainerInitial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MovieListContainer value)? $default, {
    TResult Function(_MovieListContainerInitial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _MovieListContainerInitial implements MovieListContainer {
  const factory _MovieListContainerInitial(
      {final List<Movie> movies,
      final int currentPage,
      final int totalPage}) = _$_MovieListContainerInitial;

  @override
  List<Movie> get movies;
  @override
  int get currentPage;
  @override
  int get totalPage;
  @override
  @JsonKey(ignore: true)
  _$$_MovieListContainerInitialCopyWith<_$_MovieListContainerInitial>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MovieListContainerCopyWith<$Res>
    implements $MovieListContainerCopyWith<$Res> {
  factory _$$_MovieListContainerCopyWith(_$_MovieListContainer value,
          $Res Function(_$_MovieListContainer) then) =
      __$$_MovieListContainerCopyWithImpl<$Res>;
  @override
  $Res call({List<Movie> movies, int currentPage, int totalPage});
}

/// @nodoc
class __$$_MovieListContainerCopyWithImpl<$Res>
    extends _$MovieListContainerCopyWithImpl<$Res>
    implements _$$_MovieListContainerCopyWith<$Res> {
  __$$_MovieListContainerCopyWithImpl(
      _$_MovieListContainer _value, $Res Function(_$_MovieListContainer) _then)
      : super(_value, (v) => _then(v as _$_MovieListContainer));

  @override
  _$_MovieListContainer get _value => super._value as _$_MovieListContainer;

  @override
  $Res call({
    Object? movies = freezed,
    Object? currentPage = freezed,
    Object? totalPage = freezed,
  }) {
    return _then(_$_MovieListContainer(
      movies: movies == freezed
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: totalPage == freezed
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MovieListContainer implements _MovieListContainer {
  const _$_MovieListContainer(
      {required final List<Movie> movies,
      required this.currentPage,
      required this.totalPage})
      : _movies = movies;

  final List<Movie> _movies;
  @override
  List<Movie> get movies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final int currentPage;
  @override
  final int totalPage;

  @override
  String toString() {
    return 'MovieListContainer(movies: $movies, currentPage: $currentPage, totalPage: $totalPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieListContainer &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality().equals(other.totalPage, totalPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalPage));

  @JsonKey(ignore: true)
  @override
  _$$_MovieListContainerCopyWith<_$_MovieListContainer> get copyWith =>
      __$$_MovieListContainerCopyWithImpl<_$_MovieListContainer>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Movie> movies, int currentPage, int totalPage)
        $default, {
    required TResult Function(
            List<Movie> movies, int currentPage, int totalPage)
        initial,
  }) {
    return $default(movies, currentPage, totalPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<Movie> movies, int currentPage, int totalPage)?
        $default, {
    TResult Function(List<Movie> movies, int currentPage, int totalPage)?
        initial,
  }) {
    return $default?.call(movies, currentPage, totalPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Movie> movies, int currentPage, int totalPage)?
        $default, {
    TResult Function(List<Movie> movies, int currentPage, int totalPage)?
        initial,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(movies, currentPage, totalPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MovieListContainer value) $default, {
    required TResult Function(_MovieListContainerInitial value) initial,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_MovieListContainer value)? $default, {
    TResult Function(_MovieListContainerInitial value)? initial,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MovieListContainer value)? $default, {
    TResult Function(_MovieListContainerInitial value)? initial,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _MovieListContainer implements MovieListContainer {
  const factory _MovieListContainer(
      {required final List<Movie> movies,
      required final int currentPage,
      required final int totalPage}) = _$_MovieListContainer;

  @override
  List<Movie> get movies;
  @override
  int get currentPage;
  @override
  int get totalPage;
  @override
  @JsonKey(ignore: true)
  _$$_MovieListContainerCopyWith<_$_MovieListContainer> get copyWith =>
      throw _privateConstructorUsedError;
}
