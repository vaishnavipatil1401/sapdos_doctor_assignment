import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Color(0xFF13235A),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35.0),
            child: Text(
              'SAPDOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildSidebarItem(Icons.dashboard, 'Categories', context),
          _buildSidebarItem(Icons.calendar_today, 'Appointment', context),
          _buildSidebarItem(Icons.chat, 'Chat', context),
          _buildSidebarItem(Icons.settings, 'Settings', context),
          _buildSidebarItem(Icons.logout, 'Logout', context),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        
      },
    );
  }
}
