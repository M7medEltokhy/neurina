// update_profile_state.dart
import 'package:equatable/equatable.dart';
import 'package:neurina/features/profile/data/user_model.dart';

abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object?> get props => [];
}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {
  final UserModel user;
  const UpdateProfileSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

final class UpdateProfileFailure extends UpdateProfileState {
  final String error;
  const UpdateProfileFailure({required this.error});

  @override
  List<Object?> get props => [error];
}