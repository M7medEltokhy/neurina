import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neurina/features/auth/cubit/auth_state.dart';
import 'package:neurina/features/auth/data/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await _authRepo.signup(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (error) => emit(AuthError(error.message)),
      (response) => emit(AuthSuccess(response.user)),
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    final result = await _authRepo.login(email: email, password: password);
    result.fold(
      (error) => emit(AuthError(error.message)),
      (response) => emit(AuthSuccess(response.user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    final result = await _authRepo.signInWithGoogle();
    result.fold(
      (error) => emit(AuthError(error.message)),
      (response) => emit(AuthSuccess(response.user)),
    );
  }
}