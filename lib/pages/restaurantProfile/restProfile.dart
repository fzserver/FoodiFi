import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Restaurant extends StatefulWidget {
  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
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
                  'Mc Donalds',
                ),
                titlePadding: EdgeInsetsDirectional.only(
                  start: 60.0,
                  bottom: 17.0,
                ),
                background: CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Text('Image $index'),
                ),
              ),
            ),
          ],
        ),
      );
}
