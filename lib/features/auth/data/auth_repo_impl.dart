import 'package:dartz/dartz.dart';
import 'package:neurina/core/constants/api_endpoints.dart';
import 'package:neurina/core/network/api_error.dart';
import 'package:neurina/core/network/api_service.dart';
import 'package:neurina/core/utils/pref_helpers.dart';
import 'package:neurina/features/auth/data/auth_model.dart';
import 'package:neurina/features/auth/data/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService = ApiService();

  @override
  Future<Either<ApiError, AuthModel>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final data = await _apiService.post(
        ApiEndpoints.signup,
        {"name": name, "email": email, "password": password},
      );
      final Model = AuthModel.fromJson(data);
      await PrefHelpers.saveToken(Model.accessToken);
      return Right(Model);
    } on ApiError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ApiError, AuthModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final data = await _apiService.post(
        ApiEndpoints.login,
        {"email": email, "password": password},
      );
      final Model = AuthModel.fromJson(data);
      await PrefHelpers.saveToken(Model.accessToken);
      return Right(Model);
    } on ApiError catch (e) {
      return Left(e);
    }
  }
}