import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'menu.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  TextEditingController deger = TextEditingController();
  int score = 0;
  String text = '';
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  print('left button clicked');
                },
                leftIcon: Icon(
                  Icons.check,
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
}
