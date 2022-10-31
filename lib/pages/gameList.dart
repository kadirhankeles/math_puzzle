import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GameList extends StatelessWidget {
  const GameList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
      child: Column(
        children: [
          Container(
            height: 6.h,
            width: 6.h,
            padding: EdgeInsets.only(right: 3),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Color(0xff26c6da)),
            child: IconButton(onPressed: () {
              
            }, icon: Icon(Icons.arrow_back_ios_new_rounded,), iconSize: 22,),
          )
        ],
      ),
    );
  }
}