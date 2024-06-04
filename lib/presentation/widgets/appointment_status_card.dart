import 'package:flutter/material.dart';

class AppointmentStatusCard extends StatelessWidget {
  final String title;
  final String count;
  final double progress;

  const AppointmentStatusCard({
    required this.title,
    required this.count,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF8FA3F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Stack(
              children: [
                Center(
                  child: CustomPaint(
                    size: Size(80, 80),
                    painter: HalfCirclePainter(progress),
                  ),
                ),
                Center(
                  child: Text(
                    count,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  final double progress;

  HalfCirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double startAngle = -90.0;
    double sweepAngle = 360.0 * progress;

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      radians(startAngle),
      radians(sweepAngle),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double radians(double degrees) {
    return degrees * 3.1415926535897932 / 180;
  }
}
