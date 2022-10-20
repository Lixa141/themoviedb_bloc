import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_themoviedb/domain/clients/account_api_client.dart';
import 'package:flutter_themoviedb/domain/clients/auth_api_client.dart';
import 'package:flutter_themoviedb/domain/data_providers/session_data_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';

abstract class AuthEvent {}

class AuthLogoutEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String login;
  final String password;

  AuthLoginEvent({
    required this.login,
    required this.password,
  });
}

class AuthCheckIsAuthEvent extends AuthEvent {}


abstract class AuthState {}

@freezed
class AuthInProgressState extends AuthState with _$AuthInProgressState {
  const factory AuthInProgressState({String? status}) = _AuthInProgressState;
}

@freezed
class AuthCheckStatusInProgressState extends AuthState
    with _$AuthCheckStatusInProgressState {
  const factory AuthCheckStatusInProgressState({String? status}) =
      _AuthCheckStatusInProgressState;
}

@freezed
class AuthFailureState extends AuthState with _$AuthFailureState {
  const factory AuthFailureState(Object error) = _AuthFailureState;
}

@freezed
class AuthAuthorizedState extends AuthState with _$AuthAuthorizedState {
  const factory AuthAuthorizedState({String? status}) = _AuthAuthorizedState;
}

@freezed
class AuthUnauthorizedState extends AuthState with _$AuthUnauthorizedState {
  const factory AuthUnauthorizedState({String? status}) =
      _AuthUnauthorizedState;
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _sessionDataProvider = SessionDataProvider();
  final _accountApiClient = AccountApiClient();
  final _authApiClient = AuthApiClient();

  AuthBloc(AuthState initialState) : super(initialState) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckIsAuthEvent) {
        await onAuthCheckIsAuthEvent(event, emit);
      } else if (event is AuthLoginEvent) {
        await onAuthLoginEvent(event, emit);
      } else if (event is AuthLogoutEvent) {
        await onAuthLogoutEvent(event, emit);
      }
    }, transformer: sequential());
    add(AuthCheckIsAuthEvent());
  }

  Future<void> onAuthCheckIsAuthEvent(
    AuthCheckIsAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthInProgressState());
    final sessionId = await _sessionDataProvider.getSessionId();
    final newState =
        sessionId != null ? const AuthAuthorizedState() : const AuthUnauthorizedState();
    emit(newState);
  }

  Future<void> onAuthLoginEvent(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthInProgressState());
      final sessionId = await _authApiClient.auth(
        username: event.login,
        password: event.password,
      );
      final accountId = await _accountApiClient.getAccountId(sessionId);
      await _sessionDataProvider.setSessionId(sessionId);
      await _sessionDataProvider.setAccountId(accountId);
      emit(const AuthAuthorizedState());
    } catch (e) {
      emit(AuthFailureState(e));
    }
  }

  Future<void> onAuthLogoutEvent(
    AuthLogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _sessionDataProvider.deleteSessionId();
      await _sessionDataProvider.deleteAccountId();
    } catch (e) {
      emit(AuthFailureState(e));
    }
  }
}
