import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_assistant/UI/button.dart';
import 'package:my_assistant/UI/gradient_background.dart';
import 'package:my_assistant/screens/start.dart';

// ignore: must_be_immutable
class ProgressScreen extends StatefulWidget {
  ProgressScreen({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    setState(() {
      _currentUser = widget._auth.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    fontSize: 32.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                _currentUser != null
                    ? Column(
                        children: [
                          CircleAvatar(
                            radius: 40.0,
                            backgroundImage: NetworkImage(_currentUser!
                                    .photoURL ??
                                'https://example.com/default-avatar.png'), // Provide a default avatar URL
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'E-mail адреса: ${_currentUser!.email}',
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Корисничко име: ${_currentUser!.displayName ?? 'No username'}',
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    : const Text(
                        'Моментално нема најавен корисник',
                        style: TextStyle(fontSize: 18.0),
                      ),
                const SizedBox(height: 30.0),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    children: [
                      _buildStatCard('Најдобар резултат',
                          '0'), // Replace '0' with actual best score
                      _buildStatCard('Најслаб резултат',
                          '0'), // Replace '0' with actual worst score
                      // Add more cards if needed
                    ],
                  ),
                ),
                Button(
                  label: 'ЗАПОЧНИ',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StartScreen(),
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
                fontSize: 20.0,
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
