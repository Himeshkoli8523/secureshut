import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:secureshut/login_page.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key, Key? key1});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? 'No Name'; // Get user's display name or set to 'No Name' if not available

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Account Settings'),
            const SizedBox(height: 20),
            Text('Name: $displayName'), // Display user's name
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Implement logout functionality here
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyLogin()), // Navigate to login page
                  );
                } catch (e) {
                  print("Error signing out: $e");
                }
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
