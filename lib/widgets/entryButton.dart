import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EntryButton extends StatelessWidget {
  final String iconImage;
  final String buttonText;
  const EntryButton({super.key, required this.iconImage, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 60.w,
      decoration: BoxDecoration(border: Border.all(color: Color(0xff26c6da), width: 1), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconImage, height: 20, width: 20, color: Color(0xff26c6da),),
          SizedBox(
            width: 2.h,
          ),
          Text(buttonText, style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16,letterSpacing: 1, fontWeight: FontWeight.bold, color: Color(0xff26c6da))),),
        ],
      ),
    );
  }
}