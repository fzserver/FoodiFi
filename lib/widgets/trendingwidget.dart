import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodifi/widgets/favouritewidget.dart';

class TrendingWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) => Scaffold(
    body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Trending Restaurants',
            ),
            titlePadding: EdgeInsetsDirectional.only(
              start: 10.0,
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

        SliverFillRemaining(
            hasScrollBody: true,
            fillOverscroll: true,
            child: Column(
                children: <Widget>[
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(
                   10
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          'Popular Restaurants',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text('Filter', style:  TextStyle(color: Colors.lightBlueAccent, fontSize: 18),),
                        ),
                      ],
                    ),
                  ),

                  favouritewidget(),
                  favouritewidget(),
                  favouritewidget(),
                  favouritewidget(),


                  //  MaterialButton(onPressed: () {},child: Text('Choose Your Plan'),color: Colors.orange,textColor: Colors.white, minWidth: MediaQuery.of(context).size.width, height: 50.0),
                ]
            )

        ),

      ],
    ),
  );


}