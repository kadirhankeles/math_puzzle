import 'package:flutter/material.dart';
import 'package:math_puzzle/pages/gameList.dart';
import 'package:math_puzzle/pages/menu.dart';
import 'package:math_puzzle/widgets/entryButton.dart';
import 'package:math_puzzle/widgets/gameSelection.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (context) => theme(),)],
    builder: (context, child) {
      return Consumer(builder: (context, theme theme, widget) {
        return ResponsiveSizer(
          builder: (BuildContext, Orientation, ScreenType) {
            return MaterialApp(
              theme: theme.karanlik ? ThemeData(brightness: Brightness.dark,): ThemeData(brightness: Brightness.light,),
                debugShowCheckedModeBanner: false,
                title: 'Material App',
                home: Scaffold(
                  
                  body: GameList()
                ));
          },
        );
      },
      );
    },
      
    );
  }
}
