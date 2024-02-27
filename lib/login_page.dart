import 'package:flutter/material.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // Set background color to gray
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 130),
            child: const Text(
              'Welcome to SecureShut!',
              style: TextStyle(color: Colors.deepOrange, fontSize: 33),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3, right: 35, left: 35),
            child: Align(
              alignment: Alignment.centerLeft, // Align content to the left
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white, // Set text field background color to white
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepOrange), // Set focused border color to orange
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white, // Set text field background color to white
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepOrange), // Set focused border color to orange
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the ends
                    children: [
                      TextButton(
                        onPressed: () {
                          // Add sign-in logic here
                        },
                        child: Text(
                          'Sign in', 
                          style: TextStyle(
                            color: Colors.deepOrange, 
                            fontSize: 25, 
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add forgot password logic here
                        },
                        child: Text(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
