part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();  

  @override
  List<Object> get props => [];
}
class AuthInitial extends AuthState {}

class AuthenticationState extends AuthState{
  User? user;
  AuthenticationState({required this.user});
}
class UnAuthenticationState extends AuthState{}
