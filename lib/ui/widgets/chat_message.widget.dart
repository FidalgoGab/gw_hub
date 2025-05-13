import 'package:flutter/material.dart';
import 'package:gw_hub/ui/colors.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final bool owner;

  const ChatMessage({super.key, required this.text, this.owner = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(8),
            topLeft:
                owner ? const Radius.circular(8) : const Radius.circular(0),
            bottomRight: const Radius.circular(8),
            topRight:
                owner ? const Radius.circular(0) : const Radius.circular(8),
          ),
          color:
              owner ? redPrimary.withOpacity(0.8) : secondaryWidgetBackground),
      child: Text(
        text,
        textAlign: TextAlign.left,
        softWrap: true,
        style: TextStyle(
          color: owner ? whiteTypography : blackTypography,
          fontSize: 18,
        ),
      ),
    );
  }
}
