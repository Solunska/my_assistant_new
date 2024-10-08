import 'package:flutter/material.dart';
import 'package:my_assistant/classes/score_provider.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:my_assistant/features/user_auth/presentation/pages/LogInPage.dart';
import 'package:my_assistant/screens/methods.dart';
import 'package:my_assistant/screens/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScoreProvider(), // Provide the ScoreProvider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const StartScreen(),
          '/login': (context) => const LogInPage(),
          '/learning': (context) => const LearningMethodsScreen(),
        },
      ),
    );
  }
}
