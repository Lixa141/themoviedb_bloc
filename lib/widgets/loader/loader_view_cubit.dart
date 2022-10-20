import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_themoviedb/domain/blocs/auth_bloc.dart';


enum LoaderViewCubitState { unknown, authorized, unauthorized}

class LoaderViewCubit extends Cubit<LoaderViewCubitState> {
  final AuthBloc authBloc;
  late final StreamSubscription<AuthState> authBlocSubscription;

  LoaderViewCubit(
    LoaderViewCubitState initialState,
    this.authBloc,
  ) : super(initialState) {

    // Future.microtask(() {
      _onState(authBloc.state);
      authBlocSubscription = authBloc.stream.listen(_onState);
      authBloc.add(AuthCheckIsAuthEvent());
    // });


  }
  void _onState(AuthState state) {
    if (state is AuthAuthorizedState) {
      emit(LoaderViewCubitState.authorized);
    } else if (state is AuthUnauthorizedState) {
      emit(LoaderViewCubitState.unauthorized);
    } else {
      emit(LoaderViewCubitState.unknown);
    }
  }

  @override
  Future<void> close() {
    authBlocSubscription.cancel();
    return super.close();
  }
}

