import 'package:flutter/material.dart';

class TextListFloatButton extends StatelessWidget {
  const TextListFloatButton({super.key, this.onPressed, required this.icon});

  final VoidCallback? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      child: Icon(icon),
    );
  }
}
