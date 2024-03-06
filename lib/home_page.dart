import 'package:flutter/material.dart';
import 'package:secureshut/bottom_navigation_bar.dart.dart';
import 'package:secureshut/permissions.dart';
import 'package:secureshut/setting_page.dart';
import 'secure_s.dart'; // Import the SettingsPage class

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

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
      // Handle navigation for the second tab (if needed)

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddPermissionScreen(),
        ),
      );
    } else {
      // Handle navigation for the first tab (if needed)

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'SS'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
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
            ],
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      );
    } catch (e) {
      // Handle any potential errors during widget build
      return const Scaffold(
        body: Center(
          child: Text('Error occurred. Please try again.'),
        ),
      );
    }
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
