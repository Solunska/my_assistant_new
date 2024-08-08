import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onPressed; // Optional callback for button press

  const CustomButton({
    super.key,
    required this.image,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 170, // Fixed width
              height: 120, // Fixed height
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(0, 4), // Shadow position
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Image.asset(image),
                  iconSize: 100, // Adjusted to fit the container better
                  onPressed: onPressed,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 170, // Fixed width
              height: 60, // Fixed height
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                  backgroundColor: const Color.fromARGB(255, 6, 26, 42),
                  elevation: 20, // Shadow for the button
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
