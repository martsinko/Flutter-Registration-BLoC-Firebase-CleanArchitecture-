import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class RegisterUserUseCase implements UseCase<void, RegisterUserParams> {
  final UserRepository userRepository;

  RegisterUserUseCase(this.userRepository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) async { 

    final user = User(email: params.email, password: params.password);

    return await userRepository.registerUser(
      user.email, user.password)
  .then((result) {
    return result.map(
      (user) => right(unit),
    );
      });
        }
          }

class RegisterUserParams {
  final String email;
  final String password;

  RegisterUserParams({required this.email, required this.password});
}

