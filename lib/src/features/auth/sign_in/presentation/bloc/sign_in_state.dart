part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable{
  const SignInState();

@override
  List<Object> get props => [];

}
class SignInInitial extends SignInState {}

class SignInLoading extends SignInState{}

class SignInSuccess extends SignInState{
  final String email;
 final String password;

  const SignInSuccess({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
 
}

class SignOutSuccess extends SignInState{}

class IsSignedIn extends SignInState{}

class SignInError extends SignInState{
  final String message;

  const SignInError({required this.message});
  
  @override
  List<Object> get props => [message];
}