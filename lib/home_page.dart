// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:secureshut/bottom_navigation_bar.dart.dart';
import 'package:secureshut/permissions.dart';
import 'package:secureshut/setting_page.dart';
import 'secure_s.dart'; // Import the SettingsPage class

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SettingsPage(title: 'Settings'),
        ),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddPermissionScreen(),
        ),
      );
    } else {
      // Handle navigation for the first tab (if needed)
      // In this case, do nothing as we are already on the home screen.
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back button
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          color: Colors.grey[300], // Gray background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildOptionContainer('Secure Shut'),
              // Handle action for "Secure Shut" button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MySecure()),
                  );
                },
                child: _buildOptionContainer('Add Contacts'),
              ),
              _buildOptionContainer('Pictures'),
              // want to add pictures page is on pending
              GestureDetector(
                onTap: () => MaterialApp.router().,
              )
            ],
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildOptionContainer(String text) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.deepOrange, // Color of the rectangle
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
