import 'package:flutter/material.dart';
import 'package:gw_hub/ui/colors.dart';

class TextInputWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const TextInputWidget({
    super.key,
    required this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: 1,
      maxLines: 4,
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: secondaryWidgetBackground,
        filled: true,
        labelText: label,
        labelStyle: const TextStyle(color: inputText),
      ),
    );
  }
}
