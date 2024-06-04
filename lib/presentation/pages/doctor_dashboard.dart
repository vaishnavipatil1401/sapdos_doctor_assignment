import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_assignment/bloc/appointment/appointment_bloc.dart'; 
import 'package:sapdos_assignment/bloc/appointment/appointment_event.dart'; 
import 'package:sapdos_assignment/bloc/appointment/appointment_state.dart'; 
import 'package:sapdos_assignment/presentation/widgets/appointment_card.dart'; 
import 'package:sapdos_assignment/presentation/widgets/appointment_status_card.dart';
import 'package:sapdos_assignment/presentation/widgets/sidebar.dart'; 

class DoctorDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
          bool isLaptop = constraints.maxWidth >= 1024;

          return Row(
            children: [
              if (!isMobile) Sidebar(),
              Expanded(
                child: BlocBuilder<AppointmentBloc, AppointmentState>(
                  builder: (context, state) {
                    if (state is AppointmentLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is AppointmentLoaded) {
                      int pendingAppointments = state.appointments.where((a) => !a.isCompleted).length;
                      int completedAppointments = state.appointments.where((a) => a.isCompleted).length;

                      return Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hello!",
                                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Dr. Amol",
                                      style: TextStyle(fontSize: 35),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage: AssetImage('assets/images/doctor.png'), 
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Today's Appointments",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        AppointmentStatusCard(
                                          title: 'Pending Appointments',
                                          count: '$pendingAppointments/40',
                                          progress: pendingAppointments / 40,
                                        ),
                                        SizedBox(width: 10),
                                        AppointmentStatusCard(
                                          title: 'Completed Appointments',
                                          count: '$completedAppointments/40',
                                          progress: completedAppointments / 40,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF13235A),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Wednesday, March 7',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  if (!isMobile) Spacer(),
                                  Icon(Icons.calendar_today, color: Colors.white),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.appointments.length,
                                itemBuilder: (context, index) {
                                  final appointment = state.appointments[index];
                                  return AppointmentCard(appointment: appointment, index: index);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is AppointmentError) {
                      return Center(child: Text('Failed to load appointments'));
                    }
                    return Center(child: Text('Load Appointments'));
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<AppointmentBloc>(context).add(LoadAppointments());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
