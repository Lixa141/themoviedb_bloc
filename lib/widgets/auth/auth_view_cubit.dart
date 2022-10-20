import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_themoviedb/domain/blocs/auth_bloc.dart';
import 'package:flutter_themoviedb/domain/clients/api_client_exception.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_view_cubit.freezed.dart';

abstract class AuthViewCubitState {}

@freezed
class AuthViewCubitFormFillingState extends AuthViewCubitState
    with _$AuthViewCubitFormFillingState {
  const factory AuthViewCubitFormFillingState({
    @Default('') String status,
  }) = _AuthViewCubitFormFillingState;
}

@freezed
class AuthViewCubitErrorState extends AuthViewCubitState
    with _$AuthViewCubitErrorState {
  const factory AuthViewCubitErrorState(String errorMessage) =
      _AuthViewCubitErrorState;
}

@freezed
class AuthViewCubitProgressState extends AuthViewCubitState
    with _$AuthViewCubitProgressState {
  const factory AuthViewCubitProgressState({
    @Default('') String status,
  }) = _AuthViewCubitProgressState;
}

@freezed
class AuthViewCubitSuccessState extends AuthViewCubitState
    with _$AuthViewCubitSuccessState {
  const factory AuthViewCubitSuccessState({
    @Default('') String status,
  }) = _AuthViewCubitSuccessState;
}

class AuthViewCubit extends Cubit<AuthViewCubitState> {
  final AuthBloc authBloc;
  late final StreamSubscription<AuthState> authBlocSubscription;

  AuthViewCubit(
    AuthViewCubitState initialState,
    this.authBloc,
  ) : super(initialState) {
    _onState(authBloc.state);
    authBlocSubscription = authBloc.stream.listen(_onState);
  }

  void auth({
    required String login,
    required String password,
  }) {
    if (login.isEmpty || password.isEmpty) {
      emit(const AuthViewCubitErrorState('Fill login or password'));
      return;
    }
    authBloc.add(AuthLoginEvent(login: login, password: password));
  }

  void _onState(AuthState state) {
    if (state is AuthAuthorizedState) {
      authBlocSubscription.cancel();
      emit(const AuthViewCubitSuccessState());
    } else if (state is AuthUnauthorizedState) {
      emit(const AuthViewCubitFormFillingState());
    } else if (state is AuthFailureState) {
      final message = _mapErrorToMessage(state.error);
      emit(AuthViewCubitErrorState(message));
    }
    else if (state is AuthInProgressState) {
      emit(const AuthViewCubitProgressState());
    }
    else if (state is AuthCheckStatusInProgressState) {
      emit(const AuthViewCubitProgressState());
    }
  }

  String _mapErrorToMessage(Object error) {
    if (error is! ApiClientException) {
      return 'Unknown error, try again';
    }
    switch (error.type) {
      case ApiClientExceptionType.network:
        return 'Server is unavailable. Check internet connection';
      case ApiClientExceptionType.auth:
        return 'Wrong username or password';
      case ApiClientExceptionType.sessionExpired:
      case ApiClientExceptionType.other:
        return 'Something went wrong. Try again later';
    }
  }

  @override
  Future<void> close() {
    authBlocSubscription.cancel();
    return super.close();
  }
}
//
// class AuthViewModel extends ChangeNotifier {
//   final _authService = AuthService();
//
//   final loginTextController = TextEditingController();
//   final passwordTextController = TextEditingController();
//   String? _errorMessage;
//
//   String? get errorMessage => _errorMessage;
//
//   bool _isAuthProgress = false;
//
//   bool get canStartAuth => !_isAuthProgress;
//
//   bool get isAuthProgress => _isAuthProgress;
//
//   Future<String?> _login(String login, String password) async {
//     try {
//       await _authService.login(login, password);
//     } on ApiClientException catch (e) {
//       switch (e.type) {
//         case ApiClientExceptionType.network:
//           return 'Server is unavailable. Check internet connection';
//         case ApiClientExceptionType.auth:
//           return 'Wrong username or password';
//         case ApiClientExceptionType.sessionExpired:
//         case ApiClientExceptionType.other:
//           return 'Something went wrong. Try again later';
//       }
//     } catch (e) {
//       return 'Unknown error, try again';
//     }
//     return null;
//   }
//
//   Future<void> auth(BuildContext context) async {
//     final login = loginTextController.text;
//     final password = passwordTextController.text;
//
//     if (login.isEmpty || password.isEmpty) {
//       _updateState('Fill login or password', false);
//       return;
//     }
//
//     _updateState(null, true);
//
//     _errorMessage = await _login(login, password);
//
//     if (_errorMessage == null) {
//       MainNavigation.resetNavigation(context);
//     } else {
//       _updateState(_errorMessage, false);
//     }
//   }
//
//   void _updateState(String? errorMessage, bool isAuthProgress) {
//     if (_errorMessage == errorMessage && _isAuthProgress == isAuthProgress) {
//       return;
//     }
//     _errorMessage = errorMessage;
//     _isAuthProgress = isAuthProgress;
//     notifyListeners();
//   }
// }
