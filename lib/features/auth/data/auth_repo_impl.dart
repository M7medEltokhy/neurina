import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:neurina/core/constants/api_endpoints.dart';
import 'package:neurina/core/network/api_error.dart';
import 'package:neurina/core/network/api_service.dart';
import 'package:neurina/core/utils/pref_helper.dart';
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
      final data = await _apiService.post(ApiEndpoints.signup, {
        "name": name,
        "email": email,
        "password": password,
      });
      final Model = AuthModel.fromJson(data);
      await PrefHelper.saveToken(Model.accessToken);
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
      final data = await _apiService.post(ApiEndpoints.login, {
        "email": email,
        "password": password,
      });
      final Model = AuthModel.fromJson(data);
      await PrefHelper.saveToken(Model.accessToken);
      return Right(Model);
    } on ApiError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ApiError, AuthModel>> signInWithGoogle() async {
    try {
      await GoogleSignIn.instance.initialize(
        clientId: Platform.isIOS
            ? '259679132344-08d1j6of13v0b9m4fp25afj9kdgutua5.apps.googleusercontent.com'
            : null,
        serverClientId:
            '259679132344-rr0i75833qjcd6cedbj5vq9cea07m87i.apps.googleusercontent.com',
      );

      final GoogleSignInAccount account = await GoogleSignIn.instance
          .authenticate();

      final GoogleSignInAuthentication auth = await account.authentication;
      final String? idToken = auth.idToken;
      if (idToken == null) return Left(ApiError(message: 'No ID Token'));

      final data = await _apiService.post(ApiEndpoints.googleLogin, {
        "id_token": idToken,
        "provider": "google",
      });
      final model = AuthModel.fromJson(data);
      await PrefHelper.saveToken(model.accessToken);
      return Right(model);
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      if (e is GoogleSignInException &&
          e.code == GoogleSignInExceptionCode.canceled) {
        return Left(ApiError(message: 'Cancelled'));
      }
      return Left(ApiError(message: e.toString()));
    }
  }
}
