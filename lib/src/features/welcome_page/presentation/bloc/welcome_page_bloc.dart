import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'welcome_page_event.dart';
part 'welcome_page_state.dart';

class WelcomePageBloc extends Bloc<WelcomePageEvent, WelcomePageState> {
  WelcomePageBloc() : super(WelcomePageInitial()) {
    on<WelcomePageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
