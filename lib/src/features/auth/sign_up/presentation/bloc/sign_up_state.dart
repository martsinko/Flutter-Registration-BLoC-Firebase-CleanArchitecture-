part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();  

  @override
  List<Object> get props => [];
}
class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState{}

class SignUpSuccess extends SignUpState{
  final String email;
 final String password;

  const SignUpSuccess({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
 
}

class SignUpError extends SignUpState{
  final String message;

  const SignUpError({required this.message});
  
  @override
  List<Object> get props => [message];
}
 
  


