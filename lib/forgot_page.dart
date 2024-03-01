import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyForgot extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  MyForgot({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      backgroundColor: Colors.grey[300], // Set background color to gray 300
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            ElevatedButton(
              child: const Text('Reset Password'),
              onPressed: () async {
                String email = _emailController.text.trim();
                if (email.isNotEmpty) {
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password reset email sent')),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No user found with that email')),
                      );
                    } else if (e.code == 'too-many-requests') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Too many requests. Please try again later.')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.message ?? 'An error occurred'}')),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error occurred while sending password reset email')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter your email')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
