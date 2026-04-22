import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neurina/features/profile/cubit/contact_us_state.dart';
import 'package:neurina/features/profile/data/profile_repo.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final ProfileRepo profileRepo;
  ContactUsCubit({required this.profileRepo}) : super(ContactUsInitial());

  Future<void> sendMessage({
    required String name,
    required String email,
    required String message,
  }) async {
    emit(ContactUsLoading());
    final result = await profileRepo.sendMessage(
      name: name,
      email: email,
      message: message,
    );
    result.fold(
      (error) => emit(ContactUsFailure(error: error.message)),
      (message) => emit(ContactUsSuccess(message: message)),
    );
  }
}
