import 'package:flutter/material.dart';
import 'package:gw_hub/ui/colors.dart';

class TextInputWidget extends StatelessWidget {
  final String label;

  const TextInputWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
