import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  // var fireEmail = LocalStorageService().getFromDisk('fireuser');

  int photoindex = 0;

  List<String> photos = [
    'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
  ];

  void previousImage() {
    setState(() {
      photoindex = photoindex > 0 ? photoindex - 1 : 0;
    });
  }

  void nextImage() {
    setState(() {
      photoindex = photoindex < photos.length - 1 ? photoindex + 1 : photoindex;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Sydney,AUS',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Container(
            height: 250.0,
            child: PageView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            photos[0],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 250.0,
                    ),
                    Positioned(
                      bottom: 0.0,
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'vegetables',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            photos[1],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 250.0,
                    ),
                    Positioned(
                      bottom: 0.0,
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'Chicken',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 50.0),
                              ),
                            ],
                          ),
                        ],

                        // child: Text(
                        //   'chicken',
                        //   style: TextStyle(color: Colors.pink, fontSize: 50.0),
                        // ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
