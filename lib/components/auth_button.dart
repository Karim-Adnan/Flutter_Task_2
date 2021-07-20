import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final Color buttonColor;

  const AuthButton({
    required this.title,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.035),
      child: Container(
        height: screenWidth * 0.15,
        // width: screenWidth * 0.65,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(2.5, 5),
                spreadRadius: 1,
                blurRadius: screenWidth * 0.04,
              ),
            ]),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}
