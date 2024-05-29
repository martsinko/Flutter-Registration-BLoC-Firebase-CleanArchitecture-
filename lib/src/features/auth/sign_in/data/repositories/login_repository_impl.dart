
import 'package:dartz/dartz.dart';
import 'package:smart_identificator/src/core/errors/failures.dart';
import 'package:smart_identificator/src/features/auth/sign_in/data/datasources/remote/login_remote.dart';
import 'package:smart_identificator/src/features/auth/sign_in/domain/entities/existing_user.dart';
import 'package:smart_identificator/src/features/auth/sign_in/domain/repositories/login_repository.dart';

class ExUserRepositoryImpl implements ExUserRepository{
  final LoginRemoteDataSource loginDataSource;

  ExUserRepositoryImpl({required this.loginDataSource});

  @override
  Future<Either<Failure, ExUser>> loginUser(String email, String password) async{
   

   try{
    final exUser = await loginDataSource.loginUser(email, password);

  return Right(
          ExUser(email: exUser.email, password: exUser.password)
      );
   } catch(e){
    throw Exception("Failed to login");
   }
  }
   @override
     Future<void> signOut() async{
     return await loginDataSource.signOut();
   }
  

}