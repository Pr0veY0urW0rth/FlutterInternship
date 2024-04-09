import 'package:flutter/material.dart';

class TextEditingField extends StatelessWidget {
  const TextEditingField({
    super.key,
    this.onChanged,
    this.errorText,
    this.focusNode,
    this.hintText,
    required this.inputType,
    required this.text,
    this.controller,
  });

  final Function(String)? onChanged;
  final String? errorText;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputType inputType;
  final String text;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    controller?.text = text;
    controller?.selection =
        TextSelection.fromPosition(TextPosition(offset: text.length));
    return TextField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      autocorrect: false,
      keyboardType: inputType,
      onChanged: onChanged,
      maxLines: null,
    );
  }
}
