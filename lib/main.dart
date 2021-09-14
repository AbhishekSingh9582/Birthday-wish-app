import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'MainMenu.dart';
import 'frontPage.dart';
import 'PhotoCollage.dart';
import 'LoveYourself.dart';
import 'brithdayWish.dart';
import 'DetailChat.dart';
import 'checkActivation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    CheckActivation.isActiveLoveYourself = false;
    CheckActivation.isActivePhotoCollage = false;
    CheckActivation.isActiveAnimation = true;

    // List pageList = [
    //   FrontPage(_changePage),
    //   MainMenu(_changePage, activeBirthday),
    //   PhotoCollage(_changePage),
    //   LoveYourself(_changePage),
    //   BirthdayWish(_changePage),
    // ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'GreatVibes', color: Colors.orange, fontSize: 18),
            ),
        fontFamily: 'AkayaTelivigala',
      ),
      // home: Scaffold(
      //   body: pageList[currInd],

      // initialRoute: 'frontPage',  Using this we can change default initial route '/' to 'frontPage
      routes: {
        '/': (ctx) =>
            FrontPage(), //We can set home route by default it is set by '/' .
        '/detail-chat': (ctx) => DetailOfChat(),
        '/main-Menu': (ctx) => MainMenu(),
        '/birthday-wishes': (ctx) => BirthdayWish(),
        '/photo-collage': (ctx) => PhotoCollage(),
        '/love-yourself': (ctx) => LoveYourself(),
      },
    );
  }
}
