import 'package:flutter/material.dart';
import 'package:practise_flutter/GameLevel/game_level.dart';
import 'package:practise_flutter/GameLevel/sudoku_solver.dart';
import 'package:practise_flutter/animated_text.dart';
import 'package:practise_flutter/widgets/app_buttons.dart';
import 'package:practise_flutter/widgets/app_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'homepage.dart';
import 'package:practise_flutter/GameLevel/sudoku_solver.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
          labelLarge: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black // Light mode text color
                : Colors.white, // Dark mode text color
            fontSize: 25,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:const  CustomAppBar(
          titleWidget: AnimatedSudoku(),
          leading: Text(""),
          size: 0,
        ),
        // Buttons

        body: Stack(
            children:[
              Opacity(
                opacity: 0.6,
                child: Container(
                  decoration: const  BoxDecoration(
                      image: DecorationImage(
                          image:  NetworkImage(
                              'https://img.tapimg.net/market/images/734f283771debbc0c3120cd563422015.png?imageView2/0/w/720/h/405/q/80/format/jpg/interlace/1/ignore-error/1')
                          ,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.centerLeft,
                          invertColors: false,
                          colorFilter: ColorFilter.linearToSrgbGamma()
                      )
                  ),
                ),),

              Column(
                children: [
                  // New Game button
                  const SizedBox(height: 180,width: 30),
                  AppButtons(
                    txtColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.deepPurpleAccent// Light mode text color
                        : Colors.black,// Dark mode text color
                    bgColor: const Color.fromRGBO(155, 190, 255, 1), // Set the button color
                    text: "New Game",
                    sizeWidth: 100,
                    sizeHeight: 80,
                    fontSize: 25,
                    icon: Icons.play_circle_fill_outlined,
                    onPressedCallback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const GameLevelNew();
                        }),
                      );
                    },
                  ),
                  const SizedBox(height: 30),

                  AppButtons(
                    txtColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.indigo// Light mode text color
                        : Colors.black,//// Dark mode text color
                    bgColor: const Color.fromRGBO(155, 190, 255, 1), // Set the button color
                    text: "SuDoKu - Solver",
                    sizeWidth: 100,
                    sizeHeight: 80,
                    fontSize: 25,
                    icon: Icons.grid_on_outlined,
                    onPressedCallback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const  SudokuSolver();
                        }),
                      );
                    },
                  ),


                ],
              ),
            ]
        ),
      ),
    );
  }
}
