import 'package:flutter/material.dart';
import 'package:shoehub/shared/appstyle.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {super.key,
      this.onPress,
      required this.label,
      required this.buttonColor});

  final void Function()? onPress;
  final Color buttonColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.255,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: buttonColor,
            style: BorderStyle.solid,
          ),
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            label,
            style: appStyleWithHeight(20, buttonColor, FontWeight.bold, 1),
          ),
        ),
      ),
    );
  }
}
