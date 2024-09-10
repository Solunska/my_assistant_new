// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_assistant/UI/gradient_background.dart';
import 'package:my_assistant/features/user_auth/presentation/firebase_auth_impl/firebase_auth_services.dart';
import 'package:my_assistant/features/user_auth/presentation/pages/RegisterPage.dart';
import 'package:my_assistant/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:my_assistant/global/common/toast.dart';
import 'package:my_assistant/screens/progress.dart'; // Import the CategoriesScreen

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLogingIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Најава'),
      ),
      body: GradientBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Најавете се!',
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
                  controller: _passwordController,
                  hintText: 'Внесете ја вашата лозинка',
                  isPasswordField: true,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: _login,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                       color: const Color.fromARGB(255, 6, 26, 42),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: _isLogingIn 
                        ? const CircularProgressIndicator(color: Colors.white,) 
                        : const Text(
                            'Најава',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Уште немаш профил?",
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Регистрирај се тука!",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
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
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLogingIn = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.logInUserWithEmailAndPass(email, password);

    setState(() {
      _isLogingIn = false;
    });

    if (user != null) {
      showToast(message: "Успешна најава");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProgressScreen( ),
        ),
      );
    } else {
      showToast(message: "Настана проблем при најава на корисникот");
    }
  }
}