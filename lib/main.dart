import 'package:flutter/material.dart';
import 'package:secureshut/login_page.dart';
import 'package:secureshut/signup_page.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'secureshut',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.deepOrange,
          selectedItemColor: Colors.white,
        ),
      ),
      // Define routes
      debugShowCheckedModeBanner: false,
      initialRoute: 'login_page',
      routes: {
        'login_page':(context) => const MyLogin() ,
        // Add other routes here if needed
        'signup_page':(context) =>  MYSignUp(),
      },
      // Use initialRoute or home to specify the initial route
      // initialRoute: '/',
      // home: MyHomePage(title: 'SS'),
    );
  }
}
