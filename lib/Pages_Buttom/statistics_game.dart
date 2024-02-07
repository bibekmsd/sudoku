import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  // const StatisticsPage({super.key});
  const StatisticsPage({Key? key}) : super(key: key);
  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.blueGrey,
      title: const Text(
        "Statistics",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      centerTitle: true,
    ));
  }
}
