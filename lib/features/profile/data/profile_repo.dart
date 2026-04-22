import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:neurina/core/constants/api_endpoints.dart';
import 'package:neurina/core/network/api_error.dart';
import 'package:neurina/core/network/api_exceptions.dart';
import 'package:neurina/core/network/api_service.dart';
import 'package:neurina/features/profile/data/user_model.dart';

class ProfileRepo {
  ApiService apiService = ApiService();

  /// Get profile data
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

  /// Update profile data
  Future<Either<ApiError, UserModel>> updateProfileData({
    required String name,
    String? profilePicturePath,
  }) async {
    try {
      // TODO: لما الـ backend يعدل الـ endpoint
      // لو multipart:
      // final formData = FormData.fromMap({
      //   'name': name,
      //   if (profilePicturePath != null)
      //     'profile_picture': await MultipartFile.fromFile(profilePicturePath),
      // });
      // final response = await apiService.put(ApiEndpoints.updateProfile, formData);

      // لو base64:
      // final bytes = await File(profilePicturePath!).readAsBytes();
      // final base64Image = base64Encode(bytes);

      final response = await apiService.put(ApiEndpoints.updateProfile, {
        'name': name,
      });

      final updatedUser = UserModel.fromJson(response);
      return Right(updatedUser);
    } on DioError catch (e) {
      return Left(ApiExceptions.handleError(e));
    } catch (e) {
      return Left(ApiError(message: 'An unexpected error occurred'));
    }
  }

}
