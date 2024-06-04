import 'package:flutter/material.dart';
import '../../models/appointment.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final int index; 

  const AppointmentCard({required this.appointment, required this.index});

  @override
  Widget build(BuildContext context) {
    Color patientNameBorderColor = index % 2 == 0 ? Colors.red : Colors.green;
    Color iconColor = index % 2 == 0 ? Colors.red : Colors.green;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14), 
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300], 
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.access_time, color: iconColor),
          ),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              appointment.time,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(color: patientNameBorderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.person, color: Colors.green),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      appointment.patientName,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Text(
                    '${appointment.age} years', 
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
