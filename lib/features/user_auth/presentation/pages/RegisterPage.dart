import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_assistant/features/user_auth/presentation/firebase_auth_impl/firebase_auth_services.dart';
import 'package:my_assistant/features/user_auth/presentation/pages/LogInPage.dart';
import 'package:my_assistant/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:my_assistant/global/common/toast.dart';
import 'package:my_assistant/screens/progress.dart';  // Make sure to import your ProgressScreen

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isRegistering = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрација'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Регистрирајте се!',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              FormContainerWidget(
                controller: _emailController,
                hintText: 'Внесете ја вашата e-mail адреса',
                isPasswordField: false,
              ),
              const SizedBox(height: 10),
              FormContainerWidget(
                controller: _usernameController,
                hintText: 'Внесете го вашето корисничко име',
                isPasswordField: false,
              ),
              const SizedBox(height: 10),
              FormContainerWidget(
                controller: _passwordController,
                hintText: 'Внесете ја вашата лозинка',
                isPasswordField: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _register,
                child: _isRegistering ? CircularProgressIndicator(color: Colors.white) : Text(
                  'Регистрација',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Веќе имаш профил?",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LogInPage()),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      "Најавете се тука!",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    setState(() {
      _isRegistering = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.registerWithEmailAndPass(email, password, username);

    setState(() {
      _isRegistering = false;
    });

    if (user != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ProgressScreen()),
        (route) => false,
      );
    } else {
      showToast(message: "Грешка при креирање на корисник");
    }
  }
}