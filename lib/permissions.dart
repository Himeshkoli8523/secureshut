// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';

class AddPermissionScreen extends StatelessWidget {
  const AddPermissionScreen({super.key, Key? key1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get started with secure shut'),
      ),
      backgroundColor: Colors.grey[300], // Set the background color
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PermissionItem(
              permissionName: 'Camera',
              icon: Icons.camera_alt,
              onPressed: () async {
                final status = await Permission.camera.request();
                if (status.isGranted) {
                  // Permission granted, proceed with camera-related functionality
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Camera Permission Granted'),
                      content: const Text('You can now use the camera.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Permission denied, show an explanatory message
                  // and provide a way to request it again
                }
              },
            ),
            const SizedBox(height: 24.0),
            _PermissionItem(
              permissionName: 'Location',
              icon: Icons.location_on,
              onPressed: () async {
                final status = await Permission.location.request();
                if (status.isGranted) {
                  // Permission granted, proceed with location-related functionality
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Location Permission Granted'),
                      content: const Text('You can now access location services.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Permission denied, show an explanatory message
                  // and provide a way to request it again
                  print('Location permission denied.');
                }
              },
            ),
            const SizedBox(height: 24.0),
            _PermissionItem(
              permissionName: 'Accessibility',
              icon: Icons.accessibility,
              onPressed: () {
                // Handle accessibility permission
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Some information goes here.'),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => AppSettings.openAppSettings(type: AppSettingsType.accessibility),
                            child: const Text('Navigate'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 24.0),
            _PermissionItem(
              permissionName: 'Contacts',
              icon: Icons.contacts,
              onPressed: () {
                // Handle contacts permission
              },
            ),
            const SizedBox(height: 24.0),
            _PermissionItem(
              permissionName: 'Microphone', // Microphone permission block
              icon: Icons.mic,
              onPressed: () async {
                final status = await Permission.microphone.request();
                if (status.isGranted) {
                  // Permission granted, proceed with microphone-related functionality
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Microphone Permission Granted'),
                      content: const Text('You can now use the microphone.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Permission denied, show an explanatory message
                  // and provide a way to request it again
                  print('Microphone permission denied.');
                }
              },
            ),
            const SizedBox(height: 24.0),
            _PermissionItem(
              permissionName: 'Device Admin', // Device admin permission block
              icon: Icons.admin_panel_settings,
              onPressed: () => AppSettings.openAppSettings(type: AppSettingsType.device),
              // Handle device admin permission
            ),
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
            const SizedBox(width: 24.0),
            Text(permissionName),
          ],
        ),
      ),
    );
  }
}
