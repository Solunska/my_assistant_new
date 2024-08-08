import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [ Color(0xFFFF66B3),Color.fromARGB(255, 8, 105, 185),],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,

        ),
      ),
      child: child,
    );
  }
}
