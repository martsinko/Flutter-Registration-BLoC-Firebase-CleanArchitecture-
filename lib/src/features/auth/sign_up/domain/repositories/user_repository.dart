
import 'package:dartz/dartz.dart';
import 'package:smart_identificator/src/core/errors/failures.dart';

import '../entities/user.dart';
abstract class UserRepository{
  Future<Either<Failure, User>> registerUser(String email, String password);
}