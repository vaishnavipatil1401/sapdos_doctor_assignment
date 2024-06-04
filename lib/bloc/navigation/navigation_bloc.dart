import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomePageState());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToLoginEvent) {
      yield LoginPageState();
    } else if (event is NavigateToRegisterEvent) {
      yield RegistrationPageState();
    } else if (event is NavigateToHomeEvent) {
      yield HomePageState();
    }
  }
}
