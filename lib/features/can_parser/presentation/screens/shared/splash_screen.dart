import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.grey
          ),
          height: double.infinity,
          width: double.infinity,
          child: const Center(
            child: Text(
              "Splash Screen",
              style: TextStyle(
                color: Colors.black
              ),
            ),
          )
      ),
    );
  }
}
