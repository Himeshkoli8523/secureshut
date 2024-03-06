import 'package:flutter/material.dart';

class AddPermissionScreen extends StatelessWidget {
  const AddPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Permissions'),
      ),
      backgroundColor: Colors.grey[300], // Set the background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PermissionItem(
              permissionName: 'Camera',
              icon: Icons.camera_alt,
              onPressed: () {
                // Handle camera permission
              },
            ),
            const SizedBox(height: 16.0),
            _PermissionItem(
              permissionName: 'Location',
              icon: Icons.location_on,
              onPressed: () {
                // Handle location permission
              },
            ),
            const SizedBox(height: 16.0),
            _PermissionItem(
              permissionName: 'Contacts',
              icon: Icons.contacts,
              onPressed: () {
                // Handle contacts permissio n
              },
            ),
            // Add more permission items as needed
          ],
        ),
      ),
    );
  }
}

class _PermissionItem extends StatelessWidget {
  final String permissionName;
  final IconData icon;
  final VoidCallback onPressed;

  const _PermissionItem({
    required this.permissionName,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white, // Set the background color
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16.0),
            Text(permissionName),
          ],
        ),
      ),
    );
  }
}
