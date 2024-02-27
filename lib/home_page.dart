import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.grey[300], // Gray background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildOptionContainer('Secure Shut'),
              _buildOptionContainer('Add Contacts'),
              _buildOptionContainer('Pictures'),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department_rounded,
                color: Colors.orange,
                size: 48.0,
              ),
              label: 'Fire',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      );
    } catch (e) {
      // Handle any potential errors during widget build
      print('Error during widget build: $e');
      return Scaffold(
        body: Center(
          child: Text('Error occurred. Please try again.'),
        ),
      );
    }
  }

  Widget _buildOptionContainer(String text) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.deepOrange, // Color of the rectangle
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
