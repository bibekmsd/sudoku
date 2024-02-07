import 'package:flutter/material.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medium Level Screen"),
      ),
      body: const Center(
        child: Text(
          'This is the Medium Level Screen',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
