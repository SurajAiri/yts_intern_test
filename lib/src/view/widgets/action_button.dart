import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.widthRatio = 0.9,
    this.backgroundColor = Colors.blue,
  });
  final Function()? onPressed;
  final String title;
  final double widthRatio;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(8);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        minimumSize: Size(MediaQuery.of(context).size.width * widthRatio, 25),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
