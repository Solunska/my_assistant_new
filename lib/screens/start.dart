import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_assistant/UI/gradient_background.dart';
import 'package:my_assistant/screens/methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_assistant/features/user_auth/presentation/pages/LogInPage.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFF084B83), // Assuming the background is blue
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'ЗДРАВО ДРУГАРЧЕ!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/home-screen-image.png',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LearningMethodsScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text(
                  'АЈДЕ ДА УЧИМЕ ЗАЕДНО',
                  style: TextStyle( color: Color.fromARGB(255, 6, 26, 42),fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(height: 20), // Add some space between the buttons
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LogInPage(),
                  ),
                );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: const Color.fromARGB(255, 255, 203, 203),
                  textStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                child: const Text(
                'Ова поле е за мама и тато',
                  style: TextStyle(color: Color.fromARGB(255, 135, 13, 4),fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
