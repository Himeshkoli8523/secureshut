import 'package:flutter/material.dart';
import 'package:secureshut/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'secureshut',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.deepOrange,
          selectedItemColor: Colors.white,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Colors.deepOrange,
          onPrimary: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SS'),
    );
  }
}