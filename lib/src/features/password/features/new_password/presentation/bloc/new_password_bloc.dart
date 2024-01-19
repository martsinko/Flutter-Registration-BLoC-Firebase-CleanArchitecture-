import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_password_event.dart';
part 'new_password_state.dart';

class NewPasswordBloc extends Bloc<NewPasswordEvent, NewPasswordState> {
  NewPasswordBloc() : super(NewPasswordInitial()) {
    on<NewPasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
