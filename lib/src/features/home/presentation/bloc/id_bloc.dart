import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'id_event.dart';
part 'id_state.dart';

class IdBloc extends Bloc<IdEvent, IdState> {
  IdBloc() : super(IdInitial()) {
    on<IdEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
