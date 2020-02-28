import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodifi/widgets/datewidget.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantMenu extends StatefulWidget {
  @override
  _RestaurantMenuState createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  List<String> photos = [
    'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
    'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    /*  body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Mc Donalds',
            ),
            titlePadding: EdgeInsetsDirectional.only(
              start: 60.0,
              bottom: 17.0,
            ),
            background: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
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
                )
              ],
            ),
          ),
        ),
         SliverFixedExtentList(
          itemExtent: 150.0,
          delegate:
          new SliverChildBuilderDelegate((context, index) => new ListTile(
            title: new Text("List $index"),
          )),
        ),

        SliverFillRemaining(

            child: Column(
                children: <Widget>[
                  MaterialButton(onPressed: () {},child: Text('Order Food Online'),color: Colors.orange,textColor: Colors.white, minWidth: MediaQuery.of(context).size.width, height: 50.0),
                  SizedBox(height: 20,),

                  Divider(
                    color: Colors.grey,
                    height: 3,
                  ),
                  DateWidget(),

                  new Divider(
                    color: Colors.grey,
                    height: 3,
                  ),
                  Container(
                    margin: const EdgeInsets.all( 3.0),
                    height:  MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemCount: photos.length,
                        itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.all(
                               15.0,
                            ),
                            child:           Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(5.0),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: photos[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),*/
    body:   NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Mc Donalds',
              ),
              titlePadding: EdgeInsetsDirectional.only(
                start: 60.0,
                bottom: 17.0,
              ),
              background: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
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
                  )
                ],
              ),
            ),
          ),
        ];
      },
      body: Column(
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[

          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                MaterialButton(onPressed: () {},child: Text('Order Food Online'),color: Colors.orange,textColor: Colors.white, minWidth: MediaQuery.of(context).size.width, height: 50.0),
                SizedBox(height: 20,),
                Divider(
                  color: Colors.grey,
                  height: 3,
                ),
                DateWidget(),
                SizedBox(
                    height: 80,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child:  Container(
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.share, color: Colors.black38,),
                                      Text("Share")
                                    ],
                                  ),
                                  SizedBox(width: 30,),
                                  Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.star, color: Colors.black38,),
                                      Text("Review")
                                    ],
                                  ),
                                  SizedBox(width: 30,),
                                  Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.photo, color: Colors.black38,),
                                      Text("Photos")
                                    ],
                                  ),

                                ],
                              ),
                            )
                        ),
                      ),
                    )
                ),
                Container(
                    alignment: Alignment.topLeft,
                    color: Colors.white24,
                    height: 100,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: '',
                              fit: BoxFit.cover,
                              color: Colors.grey,
                            ),
                          ),
                        ),  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0,
                                  left: 10.0
                              ),

                              child: Text(
                                'Good Thali',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 3.0,
                                  left: 10.0
                              ),
                              child: Text(
                                '11:30 to 11:PM',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                top: 3.0,
                              ),
                              child: Text(
                                '20 Queen Street NSW',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                                left: 10.0,

                              ),
                              child: Text(
                                'Asian Thali',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            )

                          ],
                        ),

                      ],
                    )

                ),
                Container(
                    height: 40,
                    padding: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Call', style: TextStyle(
                            fontSize: 18 ,color: Colors.black38
                        ),),
                        GestureDetector(
                          child: new Text('(+61) 2354587490',
                              style: new TextStyle(color: Colors.lightBlueAccent, fontSize: 18)),
                          onTap: () {
                            /* _launchCaller("+61) 2354587490");*/
                          },
                        ),
                      ],
                    )
                ),
                Container(
                    height: 40,
                    padding: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Cusines',style: TextStyle(
                            fontSize: 18 ,color: Colors.black38
                        ),),
                        GestureDetector(
                          child: new Text('Australian Cafe',
                              style: new TextStyle(color: Colors.lightBlueAccent, fontSize: 18)),
                          onTap: () {},
                        ),


                      ],
                    )
                ),
                Container(
                    height: 40,
                    padding: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Average Cost',style: TextStyle(
                            fontSize: 18 ,color: Colors.black38
                        ),),
                        GestureDetector(
                          child: new Text('\u0024 20 to \u0024 50',
                              style: new TextStyle(color: Colors.lightBlueAccent, fontSize: 18)),
                          onTap: () {},
                        ),
                      ],
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Photos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text('+ Add'),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  height: 50.0,
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
                          child:           Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: photos[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Reviews',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
             /*  UserReviewWidget()*/
               /* RestaurantDetail(),*/
              ],
            ),
          ),




        ],
      ),
    ),);
}

_launchCaller(String s) async {
  const url = "tel: (+61) 2354587490";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
