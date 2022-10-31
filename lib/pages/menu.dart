import 'package:flutter/material.dart';
import 'package:math_puzzle/pages/gameList.dart';
import 'package:math_puzzle/widgets/entryButton.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    List<String> iconImage = [
      "assets/play-button.png",
      "assets/squares.png",
      "assets/star.png",

    ];
    List<String> buttonText = [
      "PLAY",
      "LEVELS",
      "RATE US",
    ];
  
    return Consumer(
      builder: (context, theme theme, widget) {
        return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Container(
            margin: EdgeInsets.only(bottom: 17.h,top: 3.h, left: 37.h),
            child: IconButton(
            splashRadius: 20,
            onPressed: () {
            theme.temaDegistir();
            
            
          }, icon: Image(image: theme.karanlik ? AssetImage("assets/sun.png"): AssetImage("assets/moon.png")),color: Colors.white,),
          ),
          Center(child: Image.asset("assets/logo1.png", height: 100, width: 100,)),
          SizedBox(height: 5.h,),
          Container(
            width: 60.w,
            
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: iconImage.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 2.h),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameList(),));
                    },
                    child:  EntryButton(iconImage: iconImage[index], buttonText: buttonText[index]),
                    
                  ),
                );
                SizedBox(height: 5.h,);
            },),
          ),
          ]
        ),
      );
      },
     
    );
  }
}

class theme extends ChangeNotifier{
  late bool karanlik=false;
  void temaDegistir(){
    karanlik = !karanlik;
    notifyListeners();
  }
}