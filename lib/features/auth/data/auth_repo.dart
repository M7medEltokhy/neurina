import 'package:dartz/dartz.dart';
import 'package:neurina/core/network/api_error.dart';
import 'package:neurina/features/auth/data/auth_model.dart';

abstract class AuthRepo {
  Future<Either<ApiError, AuthModel>> signup({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<ApiError, AuthModel>> login({
    required String email,
    required String password,
  });

  Future<Either<ApiError, AuthModel>> signInWithGoogle();
}