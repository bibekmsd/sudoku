import 'package:flutter/material.dart';

class ImpossibleScreen extends StatelessWidget {
  const ImpossibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Level Screen'),
      ),
      body: const Center(
        child: Text(
          'This is the Impossible Level Screen',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
