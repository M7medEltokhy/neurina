import 'package:equatable/equatable.dart';

abstract class ContactUsState extends Equatable {
  const ContactUsState();

  @override
  List<Object?> get props => [];
}

final class ContactUsInitial extends ContactUsState {}

final class ContactUsLoading extends ContactUsState {}

final class ContactUsSuccess extends ContactUsState {
  final String message;
  const ContactUsSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

final class ContactUsFailure extends ContactUsState {
  final String error;
  const ContactUsFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
