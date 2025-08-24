import 'package:eduguide/screens/auth/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 20,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tabs
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Log in',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF407BFF),
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 2,
                              width: 62,
                              color: Color(0xFF407BFF),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFB7B7B7),
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 6),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  // Email
                  Text('Your Email', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  SizedBox(height: 8),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      filled: true,
                      fillColor: Color(0xFFF6F7FB),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFF407BFF)),
                      ),
                    ),
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 18),

                  // Password
                  Text('Password', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  SizedBox(height: 8),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      filled: true,
                      fillColor: Color(0xFFF6F7FB),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFF407BFF)),
                      ),
                      suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey),
                    ),
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size(50, 30)),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Color(0xFF407BFF),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: Text('Continue', style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF407BFF),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Or divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: Color(0xFFE5E7EB), thickness: 1)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Or', style: TextStyle(color: Color(0xFFB7B7B7))),
                      ),
                      Expanded(child: Divider(color: Color(0xFFE5E7EB), thickness: 1)),
                    ],
                  ),
                  SizedBox(height: 18),

                  // Login with Apple
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.apple, color: Colors.black),
                      label: Text('Login with Apple', style: TextStyle(color: Colors.black, fontSize: 15)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        side: BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

                  // Login with Google
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.g_mobiledata, color: Colors.black),
                      label: Text('Login with Google', style: TextStyle(color: Colors.black, fontSize: 15)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        side: BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  // Sign up link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t have an account? ', style: TextStyle(color: Colors.black54, fontSize: 15)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SignupPage()),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Color(0xFF407BFF), fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
