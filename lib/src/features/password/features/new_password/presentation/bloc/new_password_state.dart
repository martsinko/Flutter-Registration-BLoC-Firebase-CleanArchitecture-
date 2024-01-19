part of 'new_password_bloc.dart';

abstract class NewPasswordState extends Equatable {
  const NewPasswordState();  

  @override
  List<Object> get props => [];
}
class NewPasswordInitial extends NewPasswordState {}
