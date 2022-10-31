import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_puzzle/pages/gameScreen.dart';
import 'package:math_puzzle/widgets/gameSelection.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'menu.dart';

class GameList extends StatelessWidget {
  const GameList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> gameIcon = ["assets/time.png"];
    List<String> gameName = ["Calculate"];
    int score = 0;
    return Consumer(
      builder: (context, theme theme, widget) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //Geri butonu
                  margin: EdgeInsets.only(right: 75.w),
                  height: 6.h,
                  width: 6.h,
                  padding: EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xff26c6da)),
                  child: IconButton(
                    splashRadius: 30,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                    iconSize: 22,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                    padding: EdgeInsets.only(left: 1.5.h),
                    child: Text(
                      "Math Puzzle",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 24,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              color: theme.karanlik
                                  ? Color(0xff26c6da)
                                  : Colors.black)),
                    )),
                Container(
                    padding: EdgeInsets.only(left: 1.5.h, top: 1.h),
                    child: Text(
                        "Each game with simple calculation with different \napproach.",style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              color: theme.karanlik
                                  ? Color(0xff26c6da)
                                  : Colors.grey.shade800)),),),
                Center(
                  child: Container(
                    width: 85.w,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: gameIcon.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2.h),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameScreen(),));
                            },
                            child: Ink(
                              child: gameSelection(
                                  gameIcon: gameIcon[index],
                                  gameName: gameName[index],
                                  score: score),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
