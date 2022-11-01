import 'dart:async';

import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'menu.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static const maxSeconds = 10;
  int seconds = maxSeconds;
  Timer? timer;
  @override
  int score = 0;
  String text = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  Widget build(BuildContext context) {

    return Consumer(
      builder: (context, theme theme, widget) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 12.h),
                    child: Image(
                      image: AssetImage("assets/contest.png"),
                      height: 32,
                      width: 32,
                    )),
                SizedBox(
                  width: 1.h,
                ),
                Text(
                  score.toString(),
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [SizedBox(width: double.infinity,
              //height: 10,
              child: LinearProgressIndicator(
                value: seconds/maxSeconds,
                minHeight: 5,
                backgroundColor: Colors.blue,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),),
              //Text("${seconds}"),
              SizedBox(height: 24.h,),
              
              /*  Container(
              height: 6.h,
              width: 25.h,
              //color: Colors.red,
              child: TextField(
                autofocus: true,
                cursorHeight: 0,
                cursorWidth: 0,
                keyboardType: TextInputType.none,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  )
                ),
              ),
            ),*/
              Container(
                height: 6.h,
                width: 25.h,
                decoration: BoxDecoration(border: Border.all(color: theme.karanlik ? Colors.white : Colors.black, width: 1), borderRadius: BorderRadius.circular(10),),
                child: Center(child: Text(text, style: TextStyle(fontSize: 28),),),
              ),
              NumericKeyboard(
                onKeyboardTap: _onKeyboardTap,
                textColor: theme.karanlik ? Colors.white : Colors.black,
                rightButtonFn: () {
                  setState(() {
                    text = text.substring(0, text.length - 1);
                  });
                },
                rightIcon: Icon(
                  Icons.backspace,
                  color: theme.karanlik ? Colors.white : Colors.black,
                ),
                leftButtonFn: () {
                  setState(() {
                    
                  });
                  text = '';
                  
                },
                leftIcon: Icon(
                  Icons.clear,
                  color: theme.karanlik ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }
  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (_) { 
      if(seconds > 0){setState(() => seconds--);}
      else stopTimer();
      
    });
  }
  void stopTimer(){
    timer?.cancel();
  }
}
