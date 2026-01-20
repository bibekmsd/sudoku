import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.titleWidget,
   // required this.color,
    required this .size,
  }) : super(key: key);
  final double size;
  final String? title;
  final Widget? leading;
  final Widget? titleWidget;
  // final Color color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(155, 190, 255, 1),
      centerTitle: true,
      title: titleWidget ?? Text(
        title!,
        style:  TextStyle(
          fontFamily: 'RobotoMono',
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black // Light mode text color
              : Colors.white, // Dark mode text color
          fontSize: size,
        ),
      ),
      leading: leading ??
          Transform.translate(
            offset: const Offset(5, 0),
            child: const BackButton(),


          ),
    );
  }

  @override
  Size get preferredSize => const Size(
    double.maxFinite,
    80,
  );
}
