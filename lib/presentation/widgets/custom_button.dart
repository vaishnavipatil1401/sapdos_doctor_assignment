import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  CustomButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, 
        foregroundColor: Color(0xFF13235A), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), 
          side: BorderSide(color: Color(0xFF13235A)), 
        ),
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), 
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: Color(0xFF13235A), 
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
