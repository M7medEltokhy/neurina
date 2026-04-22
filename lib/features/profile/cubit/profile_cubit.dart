import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neurina/features/profile/cubit/profile_state.dart';
import 'package:neurina/features/profile/data/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());
  Future<void> getProfile() async {
    emit(ProfileLoading());
    final result = await profileRepo.getProfileData();
    result.fold(
      (error) => emit(ProfileFailure(error: error.message)),
      (user) => emit(ProfileSuccess(user: user!)),
    );
  }
}
