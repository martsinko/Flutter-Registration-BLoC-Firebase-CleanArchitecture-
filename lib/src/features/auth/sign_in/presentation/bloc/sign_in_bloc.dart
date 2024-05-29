import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_identificator/src/features/auth/sign_in/domain/repositories/login_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  final ExUserRepository exUserRepository;

  SignInBloc({required this.exUserRepository}): super(SignInInitial()){
    on<SignInButtonPressed>((event, emit) async{
      emit(SignInLoading());

      try{

           final userResult = await exUserRepository.loginUser(event.email, event.password);

         await userResult.fold(
          (failure) async => emit(SignInError(message: failure.toString())),
          (user) async => emit(SignInSuccess(email: user.email, password: user.password)),
        );

        /*if(event is SignOutButtonPressed){
          emit(SignOutSuccess());
            await exUserRepository.signOut();
            
        }*/
      } catch(error){
        emit(SignInError(message: error.toString()));
        }
      },
      
    );
    on<SignOutButtonPressed>(((event, emit) {
      emit(SignOutSuccess());
        exUserRepository.signOut();
    }));
  }
}
