// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:secureshut/login_page.dart';

class SettingsPage extends StatefulWidget {
  final String title;

  const SettingsPage({super.key, required this.title});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.grey[300], // Set lighter background color
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to the account settings page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AccountSettingsPage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Add border
                borderRadius: BorderRadius.circular(8), // Add border radius
              ),
              child: const ListTile(
                leading: Icon(Icons.person), // Add icon for ListTile
                title: Text('Account settings'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key, Key? key2, Key? key1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.grey[300], // Set background color of Scaffold
      body: Container(
        color: Colors.grey[300], // Set background color of Container
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50), // Add space above the Row
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80), // Add space using SizedBox
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  // Implement logout functionality here
                  try {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MyLogin()), // Navigate to login page
                    );
                  } catch (e) {
                    print("Error signing out: $e");
                  }
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
