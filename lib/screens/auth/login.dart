import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/app_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String selectedRole = 'Client';

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userRole', selectedRole);

      if (selectedRole == 'Client') {
        Navigator.pushReplacementNamed(context, '/homeClient');
      } else {
        Navigator.pushReplacementNamed(context, '/homeAdvocate');
      }
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
                  'Welcome!',
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

                /// Email Field
                AppTextField(
                  controller: emailController,
                  hintText: 'Email Address *',
                  validator: (v) =>
                  v!.isEmpty ? 'Please enter your email address' : null,
                ),
                const SizedBox(height: 16),

                /// Password Field
                AppTextField(
                  controller: passwordController,
                  hintText: 'Password *',
                  obscureText: true,
                  validator: (v) =>
                  v!.isEmpty ? 'Please enter your password' : null,
                ),

                const SizedBox(height: 12),

                /// Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Implement forgot password
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF38B6FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                /// Dropdown for Role
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  decoration: const InputDecoration(
                    labelText: "Login as",
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Client', child: Text('Client')),
                    DropdownMenuItem(value: 'Advocate', child: Text('Advocate')),
                  ],
                  onChanged: (v) => setState(() => selectedRole = v!),
                ),

                const SizedBox(height: 40),

                /// Login Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton.extended(
                      backgroundColor: const Color(0xFF004AAD),
                      onPressed: () => _login(context),
                      label: const Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      icon: const Icon(Icons.login),
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
