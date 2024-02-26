import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practise_flutter/widgets/app_bar.dart';

class StatisticsPage extends StatefulWidget {
  // const StatisticsPage({super.key});
  const StatisticsPage({Key? key}) : super(key: key);
  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       appBar: CustomAppBar(
         size: 38,
         title: 'Statistics',
         leading: Text(""),
      ),
    );
  }
}
