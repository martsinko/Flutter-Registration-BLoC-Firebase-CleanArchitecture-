import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../entities/existing_user.dart';

abstract class ExUserRepository{
  Future<Either<Failure, ExUser>> loginUser(String email, String password);
  Future<void> signOut();
}