import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class gameSelection extends StatelessWidget {
  final String gameIcon;
  final String gameName;
  final int score;
  const gameSelection({super.key, required this.gameIcon, required this.gameName, required this.score});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 15.h,
        width: 85.w,
        decoration: BoxDecoration(
          border: Border.all(color:  Color(0xff26c6da),width: 1,),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [SizedBox(height: 2.h,),
            Row(
              children: [
                SizedBox(width: 2.h,),
                Image.asset(gameIcon,color:  Color(0xff26c6da), height: 24, width: 24,),
                SizedBox(width: 2.h,),
                Text(gameName, style: GoogleFonts.roboto(textStyle: TextStyle(color:  Color(0xff26c6da), fontSize: 18,fontWeight: FontWeight.w400)),)
              ],
            ),
            SizedBox(height: 1.h,),
            Text("______________________________________________",style: TextStyle(color:  Color(0xff26c6da),),),
            SizedBox(height: 1.h,),
            Row(children: [
              SizedBox(width: 2.h,),
              Text("Score:  ", style: GoogleFonts.roboto(textStyle: TextStyle(color:  Color(0xff26c6da), fontSize: 15,fontWeight: FontWeight.w400)),),
              Image.asset("assets/contest.png", height: 18, width: 18,),
              SizedBox(width: 1.w,),
              Text(score.toString(), style: GoogleFonts.roboto(textStyle: TextStyle(color:  Color(0xff26c6da), fontSize: 16,fontWeight: FontWeight.w400)),),
              SizedBox(width: 45.w,),
              Image.asset("assets/play.png", color: Color(0xff26c6da), height: 45, width: 45,)
            ],)
          ],
        ),
      ),
    );
  }
}