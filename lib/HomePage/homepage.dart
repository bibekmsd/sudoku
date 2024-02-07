import 'package:flutter/material.dart';
import 'package:practise_flutter/GameLevel/game_level.dart';
// import 'package:practise_flutter/game_level_page.dart';
import 'package:practise_flutter/widgets/app_buttons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SU-DO-KO",
          style: TextStyle(
              // color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      //Buttons
      body: Column(
        children: [
          //New Game button

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  // return const GameLevelPage();
                  return const GameLevelNew();
                }),
              );
            },
            child: AppButtons(
              txtColor: Colors.black,
              bgColor: Colors.blueGrey,
              // boderColor: Colors.green,
              // boderWidth: 4.0,
              text: "New Game",
              sizeWidth: double.infinity,
              sizeHeight: 80,
              fontSize: 25,
              icon: Icons.play_circle_fill_outlined,
            ),
          )
        ],
      ),
    );

    // bottomNavigationBar: const NavigationBarBanako(),
  }
}
