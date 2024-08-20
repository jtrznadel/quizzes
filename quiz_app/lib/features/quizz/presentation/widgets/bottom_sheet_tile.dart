import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/extensions/add_padding_extension.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';

class BottomSheetTile extends StatelessWidget {
  const BottomSheetTile(
      {super.key, required this.text, required this.icon, required this.onTap});

  final String text;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Text(
              text,
              style: context.theme.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.inter().fontFamily,
              ),
            ).addPadding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16)),
          ],
        ),
      ),
    );
  }
}
