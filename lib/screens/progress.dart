// progress_screen.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_assistant/UI/button.dart';
import 'package:my_assistant/UI/gradient_background.dart';
import 'package:my_assistant/classes/score_provider.dart';
import 'package:my_assistant/screens/methods.dart';
import 'package:provider/provider.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    final scoreProvider = Provider.of<ScoreProvider>(context);
    final shapesScore = scoreProvider.getScore('shapes');
    final numbersScore = scoreProvider.getScore('numbers');
    // Add other categories as needed

    return Scaffold(
      appBar: AppBar(
        title: const Text('Напредок'),
      ),
      body: GradientBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                const Text(
                  'Тука можете да го следите напредокот на вашето дете',
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 26, 42),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('assets/parents.png'), // Load asset image properly
                ),
                const SizedBox(height: 10.0),
                Text(
                  'E-mail адреса: ${FirebaseAuth.instance.currentUser?.email ?? 'No email'}',
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Корисничко име: ${FirebaseAuth.instance.currentUser?.displayName ?? 'No username'}',
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30.0),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    children: [
                      _buildStatCard(
                          'Форми - Најдобар резултат', shapesScore.bestScore.toString()),
                      _buildStatCard(
                          'Форми - Најслаб резултат', shapesScore.worstScore.toString()),
                      _buildStatCard(
                          'Броеви - Најдобар резултат', numbersScore.bestScore.toString()),
                      _buildStatCard(
                          'Броеви - Најслаб резултат', numbersScore.worstScore.toString()),
                      // Add more cards for other categories
                    ],
                  ),
                ),
                Button(
                  label: 'ЗАПОЧНИ',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LearningMethodsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String score) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              score,
              style: const TextStyle(
                fontSize: 36.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
