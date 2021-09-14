import 'package:flutter/material.dart';

class LoveYourself extends StatelessWidget {
  // final Function changePage;
  final text =
      'Sonali I know ,I hurt you a lot ,but I told you that " dil bada to tu bada" '
      'And your heart is big. Sorry! for everything i hurt you '
      'It means so much to me , knowing how much you care and that if either of us needs to talk'
      ', the other will be there '
      '  Your friendship is a special gift that I treasure every day and I hope you know I value it '
      'more than words can say'
      ' I feel so lucky! to have you  \n'
      '   :)';
  // LoveYourself(this.changePage);
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset('assets/Images/pageLayoutbackground.jpg',
              fit: BoxFit.fill),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 3.3, //    200,
          left: MediaQuery.of(context).size.width / 3.33, //120,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.89, //360  235
            width: MediaQuery.of(context).size.width / 1.90,
            decoration: BoxDecoration(
                color: null,
                border: Border.all(
                    color: Colors.green[800],
                    width: 1)), // Colors.orangeAccent[300],
            child: SingleChildScrollView(
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'GreatVibes',
                    color: Colors.green[800]),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 32,
          left: 180,
          child: Container(
            height: 35,
            width: 80,
            child: RaisedButton(
                shape: RoundedRectangleBorder(),
                elevation: 16.0,
                color: Colors.blue[200],
                child: FittedBox(
                  child: Text(
                    'BACK',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                onPressed: () {
                  // changePage(1);
                  Navigator.of(context).pop(true);
                }),
          ),
        )
      ],
    );

    //   child: SingleChildScrollView(
    //     child: ListView.builder(
    //       itemCount: 25,
    //       itemBuilder: (BuildContext context, int index) {
    //         return ListTile(title: Text('Item $index'));
    //       },
    //     ),
    //   ),
    // );

    // return Stack(
    //   children: [
    //     Container(
    //       height: double.infinity,
    //       width: double.infinity,
    //       child: Image.asset('assets/Images/pageLayoutbackground.jpg',
    //           fit: BoxFit.fill),
    //     ),
    //     Positioned(
    //       left: 205,
    //       top: 98,
    //       child: DraggableScrollableSheet(
    //         minChildSize: 0.25,
    //         maxChildSize: 1.0,
    //         builder: (context, scrollcontroller) {
    //           return SingleChildScrollView(controller: scrollcontroller);
    //         },
    //       ),
    //     ),
    //     FloatingActionButton(
    //       backgroundColor: Colors.orange,
    //       elevation: 16.0,
    //       // shape: CircleBorder(),
    //       // elevation: 5.5,
    //       child: Icon(Icons.arrow_left, size: 15),
    //       onPressed: () {
    //         changePage(1);
    //       },
    //       shape: CircleBorder(),
    //     ),
    //   ],
    // );
  }
}
