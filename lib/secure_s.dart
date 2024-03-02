import 'package:flutter/material.dart';

class MySecure extends StatefulWidget {
  const MySecure({super.key});

  @override
  State<MySecure> createState() => _MySecureState();
}

class _MySecureState extends State<MySecure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Screen'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(10), // Optional: Customize border radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(16), // Optional: Add padding
        margin: const EdgeInsets.all(16), // Optional: Add margin
        child: const Center(
          child: Text(
            'hello word',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MySecure(),
  ));
}
