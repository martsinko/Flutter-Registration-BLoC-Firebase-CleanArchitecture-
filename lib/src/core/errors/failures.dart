import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];

  get message => null;
}

class YourSpecificFailure extends Failure {

  final String message;

  const YourSpecificFailure({required this.message});

  @override
  List<Object> get props => [message];
  
}
