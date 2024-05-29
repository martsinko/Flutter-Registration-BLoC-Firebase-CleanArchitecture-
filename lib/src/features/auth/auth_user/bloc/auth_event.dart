part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppLoaded extends AuthEvent{
  final User user;
  // ignore: prefer_const_constructors_in_immutables
  AppLoaded({required this.user});

  @override
  List<Object> get props => [user];
}