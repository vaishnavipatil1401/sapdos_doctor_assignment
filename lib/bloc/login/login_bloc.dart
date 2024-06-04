import 'package:bloc/bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitted) {
      yield LoginLoading();
      await Future.delayed(Duration(seconds: 2)); 
      if (event.email == "test@example.com" && event.password == "password") {
        yield LoginSuccess();
      } else {
        yield LoginFailure(error: "Invalid email or password");
      }
    }
  }
}
