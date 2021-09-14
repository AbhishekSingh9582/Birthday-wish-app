import 'package:flutter/material.dart';

class DetailOfChat extends StatefulWidget {
  // final String eachChat;
  // DetailOfChat(this.eachChat);

  @override
  _DetailOfChatState createState() => _DetailOfChatState();
}

class _DetailOfChatState extends State<DetailOfChat> {
  @override
  Widget build(BuildContext context) {
    final eachChat = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Images/starBackground.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(eachChat)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.orange[100],
        onPressed: () {
          return Navigator.of(context).pop();
        },
        child: Icon(
          Icons.close,
          color: Colors.red[900],
        ),
      ),
    );
    // return Container(
    //   height: double.infinity,
    //   width: double.infinity,
    //   alignment: Alignment.center,
    //   margin: EdgeInsets.all(30),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Hero(
    //           tag: AssetImage(widget.eachChat),
    //           child: Container(
    //             height: 550,
    //             width: 400,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20.0),
    //               image: DecorationImage(
    //                   image: AssetImage(widget.eachChat), fit: BoxFit.fill),
    //             ),
    //           )),
    //       FloatingActionButton(
    //           shape: CircleBorder(),
    //           backgroundColor: Colors.orange[100],
    //           onPressed: () {
    //             return Navigator.of(context).pop();
    //           },
    //           child: Icon(
    //             Icons.close,
    //             color: Colors.red[900],
    //           )),
    //     ],
    //   ),
    // );
  }
}
