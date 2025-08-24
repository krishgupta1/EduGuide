import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs for Login and Signup (only UI, no logic)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Log in',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
                ),
                SizedBox(width: 24),
                Text(
                  'Sign up',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text('Your Email'),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(height: 16),
            Text('Password'),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {}, // Add forgot password logic
                child: Text('Forgot password?'),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {}, // Add login logic
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Or'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {}, // Add Apple login logic
              icon: Icon(Icons.apple),
              label: Text('Login with Apple'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
            ),
            SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {}, // Add Google login logic
              icon: Icon(Icons.g_mobiledata),
              label: Text('Login with Google'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don’t have an account?'),
                TextButton(
                  onPressed: () {}, // Navigate to Signup
                  child: Text('Sign up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
