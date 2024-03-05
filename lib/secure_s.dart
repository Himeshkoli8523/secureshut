import 'package:flutter/material.dart';

class MySecure extends StatefulWidget {
  const MySecure({super.key});

  @override
  State<MySecure> createState() => _MySecureState();
}

class _MySecureState extends State<MySecure> {
  final TextEditingController _mobileNumberController = TextEditingController();
  String? _mobileNumber;

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
        child: Column(
          children: [
            TextField(
              controller: _mobileNumberController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                labelText: 'Enter Mobile Number',
                counterText: '',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _mobileNumber != null
                    ? Text(
                        'S.O.S No.: $_mobileNumber',
                        style: const TextStyle(fontSize: 16),
                      )
                    : Container(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      String mobileNumber = _mobileNumberController.text;
                      if (mobileNumber.length == 10) {
                        _mobileNumber = mobileNumber;
                        _mobileNumberController.clear();
                      }
                    });
                  },
                  icon: const Icon(Icons.add_circle_rounded, size: 40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mobileNumberController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(const MaterialApp(
    home: MySecure(),
  ));
}
