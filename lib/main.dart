import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_assignment/bloc/appointment/appointment_bloc.dart';
import 'package:sapdos_assignment/presentation/pages/doctor_dashboard.dart';
import 'package:sapdos_assignment/presentation/pages/home_screen.dart';
import 'package:sapdos_assignment/repositories/appointment_repository.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAPDOS ASSIGNMENT',
      theme: ThemeData(
      ),
      home: BlocProvider(
        create: (context) => AppointmentBloc(
          appointmentRepository: AppointmentRepository(), 
        ),
         child: HomeScreen(),
      ),
    );
  }
}
