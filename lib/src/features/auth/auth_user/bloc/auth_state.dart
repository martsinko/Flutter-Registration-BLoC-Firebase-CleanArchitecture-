part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

 class AuthInitial extends AuthState {}

// ignore: must_be_immutable
class AuthenticateState extends AuthState {

final User user;
const AuthenticateState({required  this.user});

@override 
  List<Object> get props => [user];
}

class UnAuthenticateState extends AuthState{
const UnAuthenticateState();

@override
  List<Object> get props => [];
}

