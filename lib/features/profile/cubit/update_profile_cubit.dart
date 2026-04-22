import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neurina/features/profile/cubit/update_profile_state.dart';
import 'package:neurina/features/profile/data/profile_repo.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final ProfileRepo profileRepo;
  UpdateProfileCubit({required this.profileRepo}) : super(UpdateProfileInitial());

  Future<void> updateProfile({
    required String name,
    String? profilePicturePath,
  }) async {
    emit(UpdateProfileLoading());
    final result = await profileRepo.updateProfileData(
      name: name,
      profilePicturePath: profilePicturePath,
    );
    result.fold(
      (error) => emit(UpdateProfileFailure(error: error.message)),
      (user) => emit(UpdateProfileSuccess(user: user)),
    );
  }
}