import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'checkActivation.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MainMenu extends StatefulWidget {
  // final Function changePage;
  //final bool activeBirthday;
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  Widget birthdayIconAnim(BuildContext context) {
    if (CheckActivation.isActiveAnimation &&
        CheckActivation.isActiveLoveYourself &&
        CheckActivation.isActivePhotoCollage) {
      CheckActivation.isActiveAnimation = false;
      return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: Duration(seconds: 10),
        curve: Curves.easeInCirc,
        builder: (BuildContext context, double opacity, Widget child) {
          return Opacity(
            opacity: opacity,
            child: child,
          );
        },
        child: birthdayIcon(context),
      );
    } else
      return birthdayIcon(context);
  }

  Widget birthdayIcon(BuildContext context) {
    print('height screen ${MediaQuery.of(context).size.height}');
    print('widht screen ${MediaQuery.of(context).size.width}');

    return CircleAvatar(
      backgroundColor: Colors.black,
      radius: 35,
      child: MaterialButton(
        padding: EdgeInsets.all(2.0),
        shape: CircleBorder(),
        child: Image.asset('assets/Images/birthdayIcon.png', fit: BoxFit.cover),
        onPressed: () {
          // changePage(4);
          assetsAudioPlayer.open(Audio("assets/audio/Recording_4.mp3"));

          Navigator.pushNamed(context, '/birthday-wishes',
              arguments: assetsAudioPlayer);
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    Size _mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child:
              Image.asset('assets/Images/2ndBackground.jpg', fit: BoxFit.cover),
        ),
        Positioned(
          top: _mediaQuery.height / 4 - 10,
          left: 75,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.yellow,
            child: MaterialButton(
              padding: EdgeInsets.all(4.0),
              elevation: 16.0,
              splashColor: Colors.lightGreen[900],
              child: Image.asset(
                'assets/Images/CollageIcon.png',
              ),
              onPressed: () {
                // changePage(2);
                // photoCollageSelected = true;
                CheckActivation.isActivePhotoCollage = true;
                setState(() {
                  Navigator.of(context).pushNamed('/photo-collage');
                });
              },
              shape: CircleBorder(),
            ),
          ),
        ),
        Positioned(
          top: _mediaQuery.height / 3,
          left: 102,
          child: Container(
              width: 222,
              height: 222,
              child: Image.asset('assets/Images/floweBouquet.jpg')),
        ),
        Positioned(
          top: _mediaQuery.height / 4 - 10,
          right: 75,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.yellow,
            child: RawMaterialButton(
              padding: EdgeInsets.all(2.0),
              splashColor: Colors.lightGreen[900],
              child: Image.asset('assets/Images/logo-love-yourself.jpg'),
              mouseCursor: MouseCursor.uncontrolled,
              onPressed: () {
                // changePage(3);
                //loveYourselfSelected = true;

                CheckActivation.isActiveLoveYourself = true;
                setState(() {
                  Navigator.of(context).pushNamed('/love-yourself');
                });
              },
            ),
          ),
        ),
        if (CheckActivation.isActiveLoveYourself &&
            CheckActivation.isActivePhotoCollage)
          Positioned(
            bottom: _mediaQuery.height / 3 - 50,
            left: 172,
            child: birthdayIconAnim(context),
          ),

        Positioned(
          bottom: 110,
          left: 179,
          child: Container(
            height: 35,
            width: 80,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 16.0,
                  primary: Colors.orange,
                ),
                child: FittedBox(
                  child: Text(
                    'BACK',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                onPressed: () {
                  // changePage(0);
                  Navigator.of(context).pop();
                }),
          ),
        )

        // child: RawMaterialButton(
        //   elevation: 0.0,
        //   child: Image.asset('assets/Images/backgroundContrast.jpg',
        //       fit: BoxFit.cover),
        //   onPressed: () {},
        //   constraints: BoxConstraints.tightFor(
        //     width: 56.0,
        //     height: 56.0,
        //   ),
        //   shape: CircleBorder(),
        //   fillColor: Color(0xFF4C4F5E),
        // ),
      ],
    );
  }
}
