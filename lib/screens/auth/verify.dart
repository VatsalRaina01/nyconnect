import 'package:flutter/material.dart';

class VerifyScreen extends StatelessWidget {
  final String role;
  const VerifyScreen({super.key, this.role = "Client"});


  void _verify(BuildContext context) {
    if (role == 'Client') {
      Navigator.pushReplacementNamed(context, '/homeClient');
    } else {
      Navigator.pushReplacementNamed(context, '/homeAdvocate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Account")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Verification Successful!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _verify(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF004AAD),
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
