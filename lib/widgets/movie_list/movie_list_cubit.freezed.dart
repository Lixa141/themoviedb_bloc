// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieListCubitState {
  List<MovieListRowData> get movies => throw _privateConstructorUsedError;
  String get localeTag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieListCubitStateCopyWith<MovieListCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListCubitStateCopyWith<$Res> {
  factory $MovieListCubitStateCopyWith(
          MovieListCubitState value, $Res Function(MovieListCubitState) then) =
      _$MovieListCubitStateCopyWithImpl<$Res>;
  $Res call({List<MovieListRowData> movies, String localeTag});
}

/// @nodoc
class _$MovieListCubitStateCopyWithImpl<$Res>
    implements $MovieListCubitStateCopyWith<$Res> {
  _$MovieListCubitStateCopyWithImpl(this._value, this._then);

  final MovieListCubitState _value;
  // ignore: unused_field
  final $Res Function(MovieListCubitState) _then;

  @override
  $Res call({
    Object? movies = freezed,
    Object? localeTag = freezed,
  }) {
    return _then(_value.copyWith(
      movies: movies == freezed
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieListRowData>,
      localeTag: localeTag == freezed
          ? _value.localeTag
          : localeTag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieListCubitStateCopyWith<$Res>
    implements $MovieListCubitStateCopyWith<$Res> {
  factory _$$_MovieListCubitStateCopyWith(_$_MovieListCubitState value,
          $Res Function(_$_MovieListCubitState) then) =
      __$$_MovieListCubitStateCopyWithImpl<$Res>;
  @override
  $Res call({List<MovieListRowData> movies, String localeTag});
}

/// @nodoc
class __$$_MovieListCubitStateCopyWithImpl<$Res>
    extends _$MovieListCubitStateCopyWithImpl<$Res>
    implements _$$_MovieListCubitStateCopyWith<$Res> {
  __$$_MovieListCubitStateCopyWithImpl(_$_MovieListCubitState _value,
      $Res Function(_$_MovieListCubitState) _then)
      : super(_value, (v) => _then(v as _$_MovieListCubitState));

  @override
  _$_MovieListCubitState get _value => super._value as _$_MovieListCubitState;

  @override
  $Res call({
    Object? movies = freezed,
    Object? localeTag = freezed,
  }) {
    return _then(_$_MovieListCubitState(
      movies: movies == freezed
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieListRowData>,
      localeTag: localeTag == freezed
          ? _value.localeTag
          : localeTag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MovieListCubitState implements _MovieListCubitState {
  const _$_MovieListCubitState(
      {required final List<MovieListRowData> movies, required this.localeTag})
      : _movies = movies;

  final List<MovieListRowData> _movies;
  @override
  List<MovieListRowData> get movies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final String localeTag;

  @override
  String toString() {
    return 'MovieListCubitState(movies: $movies, localeTag: $localeTag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieListCubitState &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            const DeepCollectionEquality().equals(other.localeTag, localeTag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      const DeepCollectionEquality().hash(localeTag));

  @JsonKey(ignore: true)
  @override
  _$$_MovieListCubitStateCopyWith<_$_MovieListCubitState> get copyWith =>
      __$$_MovieListCubitStateCopyWithImpl<_$_MovieListCubitState>(
          this, _$identity);
}

abstract class _MovieListCubitState implements MovieListCubitState {
  const factory _MovieListCubitState(
      {required final List<MovieListRowData> movies,
      required final String localeTag}) = _$_MovieListCubitState;

  @override
  List<MovieListRowData> get movies;
  @override
  String get localeTag;
  @override
  @JsonKey(ignore: true)
  _$$_MovieListCubitStateCopyWith<_$_MovieListCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
