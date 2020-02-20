import 'dart:async';

import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  // var fireEmail = LocalStorageService().getFromDisk('fireuser');

  int photoIndex = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  List<String> photos = [
    'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
  ];

  // void previousImage() {
  //   setState(() {
  //     photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
  //   });
  // }

  // void nextImage() {
  //   setState(() {
  //     photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      photoIndex < photos.length - 1 ? photoIndex++ : photoIndex = 0;

      _pageController.animateToPage(
        photoIndex,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 250.0,
                  child: PageView(
                    controller: _pageController,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(
                      photos.length,
                      (index) => featured(photos, index),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text('Most Popular'),
                      Spacer(),
                      FlatButton(
                        onPressed: () {},
                        child: Text('View All'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  height: 180.0,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: photos.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.only(
                          right: 15.0,
                        ),
                        child: foodCard(photos[index]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text('Meal Deals'),
                      Spacer(),
                      FlatButton(
                        onPressed: () {},
                        child: Text('View All'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  height: 180.0,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: photos.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.only(
                          right: 15.0,
                        ),
                        child: foodCard(photos[index]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(Icons.map, color: Colors.black),
              activeIcon: Icon(Icons.map, color: Colors.red),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(Icons.map, color: Colors.black),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(Icons.favorite_border, color: Colors.black),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(Icons.person_outline, color: Colors.black),
            ),
          ],
        ),
      );
}

Widget foodCard(String name) => InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        child: Container(
          height: 150.0,
          width: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                name,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );

Widget featured(List<String> photos, int index) => Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                photos[index],
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: 250.0,
        ),
        Container(
          height: 250.0,
          color: Colors.black.withOpacity(.1),
        ),
        Positioned(
          bottom: 0.0,
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Vegetables',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
