
import 'package:dartz/dartz.dart';
import 'package:smart_identificator/src/core/errors/failures.dart';
import 'package:smart_identificator/src/core/usecase/usecase.dart';
import 'package:smart_identificator/src/features/auth/sign_in/domain/repositories/login_repository.dart';

import '../entities/existing_user.dart';

class LoginUserUseCase implements UseCase<void , LoginUserParams>{
  final ExUserRepository exUserRepository;

  LoginUserUseCase(this.exUserRepository);

  @override
  Future<Either<Failure, void>> call(LoginUserParams params)  async {

    final exUser = ExUser(email: params.email, password: params.password);
  
   await exUserRepository.loginUser(exUser.email, exUser.password);
      return const Right(unit);
  }

}

class LoginUserParams {
  final String email;
  final String password;

 LoginUserParams({required this.email, required this.password});
}