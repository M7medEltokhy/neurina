import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:neurina/core/constants/api_endpoints.dart';
import 'package:neurina/core/network/api_error.dart';
import 'package:neurina/core/network/api_exceptions.dart';
import 'package:neurina/core/network/api_service.dart';
import 'package:neurina/features/profile/data/user_model.dart';

class ProfileRepo {
  ApiService apiService = ApiService();
  Future<Either<ApiError, UserModel?>> getProfileData() async {
    try {
      // final token = await PrefHelper.getToken();
      // if (token == null || token == 'Guest') {
      //   return null;
      // }

      final response = await apiService.get(ApiEndpoints.profile);
      final user = UserModel.fromJson(response);
      print('Profile data fetched successfully: ${response.toString()}');
      // _currentUser = user;
      return Right(user);
    } on DioError catch (e) {
      return left(ApiExceptions.handleError(e));
    } catch (e) {
      return Left(ApiError(message: 'An unexpected error occurred'));
    }
  }
}
