import 'package:flutter/material.dart';

class HardScreen extends StatelessWidget {
  const HardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Level Screen'),
      ),
      body: const Center(
        child: Text(
          'This is the Hard Level Screen',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
