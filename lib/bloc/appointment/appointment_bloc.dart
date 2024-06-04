import 'package:flutter_bloc/flutter_bloc.dart';
import 'appointment_event.dart';
import 'appointment_state.dart';
import '../../repositories/appointment_repository.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final AppointmentRepository appointmentRepository;

  AppointmentBloc({required this.appointmentRepository}) : super(AppointmentInitial()) {
    on<LoadAppointments>((event, emit) async {
      emit(AppointmentLoading());
      try {
        final appointments = await appointmentRepository.fetchAppointments();
        emit(AppointmentLoaded(appointments: appointments));
      } catch (_) {
        emit(AppointmentError());
      }
    });
  }
}
