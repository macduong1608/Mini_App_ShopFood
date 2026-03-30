import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/page/login_page.dart';
import 'package:mini_app_flutter/src/services/auth_service.dart';

import '../widgets/button_custom.dart';
import '../widgets/input_filed_custom.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final AuthService authService = AuthService();

  bool isAgree = false;
  bool isLoading = false;
  void showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  Future<void> handleRegister() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPass = confirmPassController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      showSnackBar("Please fill in all fields", Colors.orange);
      return;
    }

    if (password != confirmPass) {
      showSnackBar("Passwords do not match", Colors.red);
      return;
    }

    if (!isAgree) {
      showSnackBar("You must agree to the Terms of Service", Colors.orange);
      return;
    }

    setState(() => isLoading = true);

    try {
      final result = await authService.register(
        fullName: name,
        email: email,
        password: password,
      );

      if (mounted) {
        setState(() => isLoading = false);

        if (result['success'] == true) {
          showSnackBar(
            "Registration successful! Please sign in.",
            Colors.green,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          showSnackBar(result['message'] ?? "Registration failed", Colors.red);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => isLoading = false);
        showSnackBar("An error occurred: $e", Colors.red);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "SD",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Color(0xFFFFFFFF), width: 0.5),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Create Account SD Store',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C1B1B),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          'assets/register_screen.png',
                          width: double.infinity,
                          height: 180,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            inputFiledCustom(
                              "Full name",
                              "Enter your full name",
                              controller: nameController,
                            ),
                            inputFiledCustom(
                              "Email address",
                              "Enter your email",
                              controller: emailController,
                            ),
                            inputFiledCustom(
                              "Password",
                              "Enter your Password",
                              controller: passwordController,
                            ),
                            inputFiledCustom(
                              "Confirm password",
                              "Re-enter your password",
                              controller: confirmPassController,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Checkbox(
                                    value: isAgree,
                                    onChanged: (val) {
                                      setState(() {
                                        isAgree = val ?? false;
                                      });
                                    },
                                    shape: CircleBorder(),
                                    side: BorderSide(
                                      color: Color(0xFFE3BFB1),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Color(0xFF1C1B1B),
                                        fontSize: 16,
                                        height: 1.4,
                                      ),
                                      children: [
                                        TextSpan(text: "I agree to the "),
                                        TextSpan(
                                          text: "Terms of Service",
                                          style: const TextStyle(
                                            color: Color(0xFFFF6600),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: " and "),
                                        TextSpan(
                                          text: "Privacy Policy",
                                          style: const TextStyle(
                                            color: Color(0xFFFF6600),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      isLoading
                          ? CircularProgressIndicator(color: Colors.orange)
                          : ButtonCustom(
                              name: 'Create Account',
                              onTap: handleRegister,
                              color: 0xFFFF6600,
                            ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF9C8D86),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Color(0xFFFF6600),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
