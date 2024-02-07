import 'package:flutter/material.dart';
import 'package:practise_flutter/NavigationBar/navigation_bar.dart';
import 'package:practise_flutter/Themes/theme_provider.dart';
// import 'package:practise_flutter/widgets/grid_suduko.dart';
import 'package:provider/provider.dart';

import 'package:practise_flutter/widgets/number_button.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyAppRun(),
  ));
}

class MyAppRun extends StatefulWidget {
  const MyAppRun({Key? key}) : super(key: key);

  @override
  State<MyAppRun> createState() => _MyAppRunState();
}

class _MyAppRunState extends State<MyAppRun> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: const NavigationBarBanako(),
          // body: const NumberButtonPad(),
        ));
    //   body: const GridSudoku(),
    // )
    // body: SudokuGrid()),
  }
}
