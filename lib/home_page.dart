import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Placeholder'),
    Text('Index 1: Placeholder'),
    Text('Index 2: Placeholder'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          // box for fake shutdown
          Positioned(
            left: 20, // Specify x coordinate
            top: 50, // Specify y coordinate
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.deepOrange, // Color of the rectangle
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Fake Shutdown', 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // box for add contacts
          Positioned(
            left: 90, // Specify x coordinate
            top: 250, // Specify y coordinate for the second block
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.deepOrange, // Color of the rectangle
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Contacts', 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // box for pictures
          Positioned(
            left: 140, // Specify x coordinate for the third block
            top: 450, // Specify y coordinate for the third block
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.deepOrange, // Color of the rectangle
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pictures', 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
  }
}
