import 'package:flutter/material.dart';

class PhotoCollage extends StatefulWidget {
  // final Function changePage;

//  PhotoCollage(this.changePage);
  @override
  _PhotoCollageState createState() => _PhotoCollageState();
}

class _PhotoCollageState extends State<PhotoCollage>
    with SingleTickerProviderStateMixin {
  List<String> _imageList = [
    'assets/Images/girlImage.jpg',
    'assets/Images/Ima1.jpg',
    'assets/Images/Ima2.jpg',
    'assets/Images/Ima5.jpg',
    'assets/Images/Ima3.jpg',
    'assets/Images/Ima4.jpg',
    'assets/Images/Ima6.jpg',
  ];
  Widget gridView() {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.8,
        children: _imageList
            .map(
              (e) => GestureDetector(
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            image: AssetImage(e), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  onTap: () {
                    return goToDetail(context, e);
                  }),
            )
            .toList(),
      ),
    );
  }

  goToDetail(BuildContext contex, String e) {
    Navigator.pushNamed(context, '/detail-chat', arguments: e);

    // Navigator.push(contex,
    //   MaterialPageRoute(builder: (BuildContext context) => DetailOfChat(e)));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // widget.changePage(1);
            Navigator.of(context).pop(true);
          },
          shape: CircleBorder(),
          child: Icon(Icons.arrow_back_sharp),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/Images/starBackground.jpg'))),
          child: gridView(),
        ),
      ),
    );
  }
}
