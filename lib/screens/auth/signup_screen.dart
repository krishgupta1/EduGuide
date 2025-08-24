import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // ✅ Simple signup function
  void signUp() {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Signed up successfully ✅")),
    );
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
                  // 🔹 Tabs (Login / Signup)
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => LoginPage()),
                            );
                          },
                          child: Column(
                            children: [
                              Text(
                                'Log in',
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
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Sign up',
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
                    ],
                  ),
                  SizedBox(height: 30),

                  // 🔹 Email
                  Text("Your Email", style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 8),
                  _buildInputField(emailController, "Enter your email"),
                  SizedBox(height: 18),

                  // 🔹 Password
                  Text("Password", style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 8),
                  _buildInputField(passwordController, "Enter your password", isPassword: true),
                  SizedBox(height: 18),

                  // 🔹 Confirm Password
                  Text("Confirm Password", style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 8),
                  _buildInputField(confirmPasswordController, "Confirm your password", isPassword: true),
                  SizedBox(height: 20),

                  // 🔹 Signup Button
                  _buildButton("Sign up", signUp, backgroundColor: Color(0xFF407BFF), textColor: Colors.white),

                  SizedBox(height: 25),

                  // 🔹 Already have account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => LoginPage()),
                          );
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(color: Color(0xFF407BFF), fontWeight: FontWeight.w600),
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

  // 📌 Reusable Input
  Widget _buildInputField(TextEditingController controller, String hint,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
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
    );
  }

  // 📌 Reusable Button
  Widget _buildButton(String text, VoidCallback onPressed,
      {Color backgroundColor = Colors.white, Color textColor = Colors.black}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 16, color: textColor)),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}

//
// 🔹 Login Page (Same UI style)
//
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

  // ✅ Simple login function
  void login() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Logged in successfully ✅")),
    );
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
                  // 🔹 Tabs (Login / Signup)
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SignupPage()),
                            );
                          },
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
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  // 🔹 Email
                  Text("Your Email", style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 8),
                  _buildInputField(emailController, "Enter your email"),
                  SizedBox(height: 18),

                  // 🔹 Password
                  Text("Password", style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 8),
                  _buildInputField(passwordController, "Enter your password", isPassword: true),
                  SizedBox(height: 20),

                  // 🔹 Login Button
                  _buildButton("Log in", login, backgroundColor: Color(0xFF407BFF), textColor: Colors.white),

                  SizedBox(height: 25),

                  // 🔹 No account yet?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SignupPage()),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Color(0xFF407BFF), fontWeight: FontWeight.w600),
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

  // 📌 Reusable Input
  Widget _buildInputField(TextEditingController controller, String hint,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
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
    );
  }

  // 📌 Reusable Button
  Widget _buildButton(String text, VoidCallback onPressed,
      {Color backgroundColor = Colors.white, Color textColor = Colors.black}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 16, color: textColor)),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
