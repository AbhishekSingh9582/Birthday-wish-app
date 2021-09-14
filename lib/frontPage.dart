import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  //final Function changePage;

  // FrontPage(this.changePage);
  final bool loveYourselfHasSelected = false;
  final bool photoCollageHasSelected = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Dear Friend !',
              style: TextStyle(
                  fontFamily: 'GreatVibes',
                  fontSize: 41,
                  color: Colors.orange[400],
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    width: 450,
                    child: Image.asset(
                      'assets/Images/BorderJasmine.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 270,
                    child: Image.asset('assets/Images/Rose.jpg',
                        fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Expanded(
              // height: 70,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  " I'm so glad you exist.\nLooking like a star,\n keep Shining",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'GreatVibes',
                      color: Colors.pinkAccent,
                      fontSize: 28),
                ),
              ),
            ),
            // SizedBox(height: 30),
            Row(children: [
              Container(
                height: 200,
                width: 300,
                child: Image.asset('assets/Images/teddy-bear.jpg',
                    fit: BoxFit.cover),
              ),
              FloatingActionButton(
                //backgroundColor: Colors.transparent,
                child: Text(
                  'next',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/main-Menu');
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
