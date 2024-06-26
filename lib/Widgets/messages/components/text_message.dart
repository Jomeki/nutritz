import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutriapp/Themes/colors.dart';

import '../../../Models/ChatMessage.dart';



class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.5),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0 * 0.75,
          vertical: 20.0 / 2,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(message!.isSender ? 1 : 0.1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          message!.text,
          style: GoogleFonts.poppins(
            color: message!.isSender
                ? Colors.white
                : Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
      ),
    );
  }
}
