import 'package:equatable/equatable.dart';
import '../../models/appointment.dart';

abstract class AppointmentState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentLoaded extends AppointmentState {
  final List<Appointment> appointments;

  AppointmentLoaded({required this.appointments});

  @override
  List<Object> get props => [appointments];
}

class AppointmentError extends AppointmentState {}
