// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:secureshut/forgot_page.dart';
import 'package:secureshut/home_page.dart';
import 'package:secureshut/signup_page.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController _emailController =
      TextEditingController(); // Controller for email text field
  final TextEditingController _passwordController =
      TextEditingController(); // Controller for password text field
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Key for the login form

  Color _emailBorderColor = Colors.grey; // Default border color for email field

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

        // Show pop-up dialog for successful login
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Login Successful'),
              content: const Text('You have been successfully logged in.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(title: 'Home'),
                        ),
                      );
                    });
                    // Close the dialog
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );

        // Navigate to home page on successful login
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MyHomePage(
                  title: 'Home')), // Assuming MyHomePage is defined correctly
        );
      } catch (e) {
        // Handle specific authentication errors and display user-friendly messages
        String errorMessage = 'An error occurred during login';
        if (e is FirebaseAuthException) {
          switch (e.code) {
            case 'user-not-found':
              errorMessage = 'User not found';
              break;
            case 'wrong-password':
              errorMessage = 'Invalid password';
              break;
            default:
              errorMessage = 'Authentication failed';
          }
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 130),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to SecureShut!',
                style: TextStyle(color: Colors.deepOrange, fontSize: 33),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _emailBorderColor =
                        Colors.deepOrange; // Change border color on hover
                  });
                },
                onExit: (_) {
                  setState(() {
                    _emailBorderColor = Colors.grey; // Reset border color
                  });
                },
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: _emailBorderColor), // Dynamic border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: login,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyForgot()),
                      );
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MYSignUp()),
                      );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyLogin());
}
