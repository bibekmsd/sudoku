import 'package:flutter/material.dart';

class NumberButtonPad extends StatelessWidget {
  final Function(int) onNumberPressed;

  const NumberButtonPad({Key? key, required this.onNumberPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust the horizontal padding as needed
      child: Stack(
        children: [
          GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10, // Adjusted itemCount to include numbers 1 to 9 and the backspace button
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) {
              final number = index + 1;

              if (number <= 9) {
                return ElevatedButton(
                  onPressed: () {
                    onNumberPressed(number);
                  },
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                    number.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                );
              } else {
                // Backspace button
                return ElevatedButton(
                  onPressed: () {
                    onNumberPressed(0); // Use a special value (e.g., -1) to represent backspace
                  },
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const  Icon(
                    Icons.backspace,
                    color: Colors.white,
                    size: 20,
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 10), // Add desired spacing at the bottom
        ],
      ),
    );
  }
}
