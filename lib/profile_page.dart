import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile and Order History'),
      ),
      body: Center(
        child:
            Text('Profile and Order History', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
