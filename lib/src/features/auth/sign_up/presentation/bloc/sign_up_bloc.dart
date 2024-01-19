import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/repositories/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;

  SignUpBloc( {required this.userRepository}) : super(SignUpInitial()) {
    on<SignUpButtonPressed>((event, emit) async {
      emit(SignUpLoading());

      try {
        final email = event.email;
        final password = event.password;

        final result = await userRepository.registerUser(email, password);

        await result.fold(
          (failure) async => emit(SignUpError(message: failure.toString())),
          (user) async => emit(SignUpSuccess(email: user.email, password: user.password)),
        );
      } catch (error) {
        emit(SignUpError(message: error.toString()));
      }
    });
  }
}
