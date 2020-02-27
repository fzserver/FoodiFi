import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodifi/constants/FFRoutes.dart';
import 'package:foodifi/constants/FoodiFi.dart';
import 'package:foodifi/widgets/searchwidget.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage>
    with SingleTickerProviderStateMixin {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Sydney,AUS',
            style: TextStyle(color: Colors.black38),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                right: 5.0,
              ),
              child: Icon(
                Icons.filter_list,
                color: Colors.black38,
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SearchWidget(),
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
                    horizontal: 5.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Most Popular',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: photos.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.only(
                          right: 15.0,
                        ),
                        child: food(context, photos[index]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Meal Deals',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text('View All'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: photos.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.only(
                          right: 14.0,
                          bottom: 13.0,
                        ),
                        child: meal(context, photos[index]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Popular Restaurants',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text('See All'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  height: 130.0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: photos.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.only(
                          right: 14.0,
                          bottom: 13.0,
                        ),
                        child: rest(context, photos[index]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

Widget rest(BuildContext context, String name) => InkWell(
      onTap: () => Navigator.pushNamed(context, FFRoutes.restaurantMenu),
      child: Container(
        alignment: Alignment.center,
        child: Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 5.0,
                offset: Offset(2.0, 3.0),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: CachedNetworkImage(
              imageUrl: name,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );

Widget food(BuildContext context, String name) => InkWell(
      onTap: () => Navigator.pushNamed(context, FFRoutes.restaurantMenu),
      child: Container(
        child: Container(
          // height: 100.0,
          width: 130.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: Colors.pinkAccent.withOpacity(.2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: name,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 5.0,
                  top: 5.0,
                  bottom: 5.0,
                ),
                child: Text(
                  'Mc Donalds',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 5.0,
                  top: 5.0,
                  bottom: 5.0,
                ),
                child: Text(
                  'Friends Colony',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 5.0,
                  top: 5.0,
                  bottom: 5.0,
                ),
                child: Text(
                  'Delhi',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget meal(BuildContext context, String name) => InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            Container(
              height: 220.0,
              width: 130.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 5.0,
                    offset: Offset(2.0, 3.0),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  imageUrl: name,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                    ],
                    tileMode: TileMode.repeated,
                  ),
                ),
                height: 55.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 30.0,
                        height: 3.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xFFFF3399),
                                const Color(0xFFFF0000)
                              ],
                              tileMode: TileMode.clamp,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1.0]),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      Text(
                        'Positioned',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '34 Places',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
          bottom: 5.0,
          left: 8.0,
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Thai Style',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '12 Places',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
