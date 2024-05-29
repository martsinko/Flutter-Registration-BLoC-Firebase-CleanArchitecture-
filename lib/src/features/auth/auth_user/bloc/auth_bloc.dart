import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_identificator/src/features/auth/auth_user/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
   final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AppLoaded>((event, emit) async {
      try{
        var isSignedIn = await authRepository.isSignedIn(); 
            if(isSignedIn){
                var user = await authRepository.getCurrentUser();
                emit(AuthenticateState(user: user!));
            }
          
           else {
            emit(const UnAuthenticateState());
            print('Не авторизовано');
          }
      } catch(e){
            emit(const UnAuthenticateState());
      }
    });
  }
}
