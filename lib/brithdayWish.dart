import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class BirthdayWish extends StatefulWidget {
  @override
  _BirthdayWishState createState() => _BirthdayWishState();
}

class _BirthdayWishState extends State<BirthdayWish>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _textController;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 14))
          ..forward();

    _textController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _textController.dispose();
    _controller.dispose();
    super.dispose();
  }

  slideAnimation(
      String image, double beginX, double beginY, double endX, double endY) {
    return SlideTransition(
      position:
          Tween<Offset>(begin: Offset(beginX, beginY), end: Offset(endX, endY))
              .animate(CurvedAnimation(
                  curve: Curves.fastOutSlowIn, parent: _controller)),
      child: Image.asset(image),
    );
  }

  transitionAnimation(String text, double textSize) {
    return RotationTransition(
      turns: Tween<double>(begin: 0.95, end: 1.05).animate(
          CurvedAnimation(curve: Curves.bounceInOut, parent: _textController)),
      child: Text(
        text,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: FontWeight.bold,
          fontFamily: 'GreatVibes',
          color: Colors.lightGreen[700],
        ),
      ),
    );
  }

  String text = 'HAPPY BIRTHDAY\n           SNEHA';
  String wish =
      ' I wish that god \nbless you with good luck\n,happiness, love, good \nhealth and success in \nevery phase of your life.';

  // bool selected = false;
  @override
  Widget build(BuildContext context) {
    final assetsAudioPlayer =
        ModalRoute.of(context).settings.arguments as AssetsAudioPlayer;
    return Scaffold(
      body: Container(
        // color: Colors.blue,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Images/backgroundBirthday.jpg'),
                fit: BoxFit.fill)),
        height: double.infinity,
        width: double.infinity,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
            left: 3,
            top: MediaQuery.of(context).size.height / 3 - 35,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: transitionAnimation(text, 23)),
          ),
          // Positioned(
          //   left: MediaQuery.of(context).size.width / 4,
          //   top: MediaQuery.of(context).size.height / 2.6,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     child: transitionAnimation('SONALI', 31),
          //   ),
          // ),
          Positioned(
            left: MediaQuery.of(context).size.width / 3.2,
            top: MediaQuery.of(context).size.height / 2.2,
            child: Container(
              height: 230,
              width: 230,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  wish,
                  style: TextStyle(
                    fontFamily: 'GreatVibes',
                    fontSize: 27,
                  ),
                ),
              ),
            ),
          ),
          slideAnimation('assets/Images/balloon2.jpg', 0.5, 0.1, 0.8, -2),
          slideAnimation('assets/Images/topBalloon.jpg', 0, -1, 0, -2.5),
          slideAnimation('assets/Images/balloonWithStars.jpg', 0, 1, 0.2, -2),
          slideAnimation('assets/Images/Balloon.jpg', -0.5, 0.2, -0.5, -3),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          assetsAudioPlayer.pause();
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
