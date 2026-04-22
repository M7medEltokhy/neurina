import 'package:equatable/equatable.dart';
import 'package:neurina/features/profile/data/user_model.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserModel user;
  const ProfileSuccess({required this.user});
}

final class ProfileFailure extends ProfileState {
  final String error;
  const ProfileFailure({required this.error});
}
