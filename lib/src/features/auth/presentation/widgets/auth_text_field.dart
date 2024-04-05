import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    this.focusNode,
    this.hintText,
    this.errorText,
    this.suffixIcon,
    this.obscureText = false,
    this.inputType = TextInputType.text,
    this.onChanged,
  });

  final Function(String)? onChanged;
  final String? errorText;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputType inputType;
  final String label;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        TextField(
          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          decoration:
              InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
          obscureText: obscureText,
          autocorrect: false,
          keyboardType: inputType,
          onChanged: onChanged,
        )
      ],
    );
  }
}
