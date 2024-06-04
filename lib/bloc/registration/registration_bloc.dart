import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/user.dart';
import '../../repositories/user_repository.dart';
import 'registration_event.dart';
import 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final UserRepository userRepository;

  RegistrationBloc({required this.userRepository}) : super(RegistrationInitial());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is RegisterUser) {
      yield RegistrationLoading();
      try {
        await userRepository.registerUser(event.user);
        yield RegistrationSuccess();
      } catch (_) {
        yield RegistrationFailure();
      }
    }
  }
}
