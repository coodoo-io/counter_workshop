import 'package:flutter/material.dart';

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
        disabledForegroundColor: Colors.black12,
      ),
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 50,
      ),
    );
  }
}
