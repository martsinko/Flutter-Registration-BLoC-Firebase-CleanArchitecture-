import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote/remote.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> registerUser(String email, String password) async {
    try {
      print('Email: $email, Password: $password');
      final result = await remoteDataSource.registerUser(email, password);
       
      return Right(User(
        email: result.email,
        password: result.password,
      )
      );
      
    } catch (e) {
      print("UserRepository Error: $e");
      throw Exception("Failed to register user");
    }
  }
}
