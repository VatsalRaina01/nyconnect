import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/app_textfield.dart';
import 'verify.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();

  String selectedRole = 'Client'; // Default role

  Future<void> _signup(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userRole', selectedRole);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => VerifyScreen(role: selectedRole),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                /// 🔹 Logo
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 90,
                  ),
                ),
                const SizedBox(height: 16),

                /// Title & Subtitle
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004AAD),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Justice delivered digitally for users and lawyers.',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                /// Name
                AppTextField(
                  controller: nameController,
                  hintText: 'Full Name *',
                  validator: (v) =>
                  v!.isEmpty ? 'Please enter your full name' : null,
                ),
                const SizedBox(height: 16),

                /// Email
                AppTextField(
                  controller: emailController,
                  hintText: 'Email Address *',
                  validator: (v) =>
                  v!.isEmpty ? 'Please enter your email address' : null,
                ),
                const SizedBox(height: 16),

                /// Password
                AppTextField(
                  controller: passwordController,
                  hintText: 'Password *',
                  obscureText: true,
                  validator: (v) =>
                  v!.isEmpty ? 'Please enter a password' : null,
                ),
                const SizedBox(height: 6),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password must be at least 8 characters, include 1 uppercase, 1 lowercase & 1 special character.',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 16),

                /// Mobile Number
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("+91",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppTextField(
                        controller: mobileController,
                        hintText: 'Mobile Number *',
                        validator: (v) =>
                        v!.isEmpty ? 'Please enter your number' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                /// 🔹 Dropdown for Role Selection
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  decoration: InputDecoration(
                    labelText: "Register as *",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 12),
                  ),
                  items: const [
                    DropdownMenuItem(
                        value: 'Client', child: Text('Client')),
                    DropdownMenuItem(
                        value: 'Advocate', child: Text('Advocate')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value!;
                    });
                  },
                ),
                const SizedBox(height: 24),

                /// 🔹 Terms
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'On clicking signup, you agree with our Terms & Conditions',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 24),

                /// 🔹 Signup Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton.extended(
                      backgroundColor: const Color(0xFF004AAD),
                      onPressed: () => _signup(context),
                      label: const Text(
                        'Sign Up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      icon: const Icon(Icons.app_registration),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                /// 🔹 Already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(color: Colors.black87)),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                            color: Color(0xFF004AAD),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
