// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
// import 'package:practise_flutter/widgets/grid_suduko.dart';
// import 'package:practise_flutter/GameLevel/easy_level.dart';

class NumberButtonPad extends StatelessWidget {
  const NumberButtonPad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      color: Colors.amber),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          index.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                        style: const ButtonStyle(
                          alignment: Alignment.center,
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),

        // Positioned outside the GridView
      ],
    );
  }
}
