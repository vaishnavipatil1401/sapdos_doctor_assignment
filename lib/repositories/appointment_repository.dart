import '../models/appointment.dart';

class AppointmentRepository {
  Future<List<Appointment>> fetchAppointments() async {
    await Future.delayed(Duration(seconds: 1)); 

    List<String> times = [
      '10:00 AM', '10:15 AM', '10:30 AM', '10:45 AM', '11.00 AM', '11.15 AM', '11.30 AM', '11.45 PM', 
      
    ];

    return List.generate(40, (index) {
      return Appointment(
        time: times[index % times.length], 
        patientName: 'Patient Name $index',
        age: 25 + index,
        isCompleted: index % 2 == 0,
      );
    });
  }
}
