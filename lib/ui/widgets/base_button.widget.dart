import 'package:flutter/material.dart';
import 'package:gw_hub/ui/colors.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool? contained;

  const BaseButton({super.key, required this.text, this.icon, this.contained});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient:
            contained == false
                ? LinearGradient(
                  colors: [Colors.transparent, Colors.transparent],
                )
                : LinearGradient(
                  colors: [redPrimary, redSecondary],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),

        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: contained == false ? blackTypography : whiteTypography,
        ),
      ),
    );
  }
}
