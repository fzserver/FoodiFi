import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class favouritewidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        elevation: 5,
        child: Container(
          height: 100,
          padding: EdgeInsets.all( 8),
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: 'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                          top: 5.0,
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
                ),
              ),
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 20,
                      color: Colors.yellow,
                      width: 30,

                      padding: EdgeInsets.all(3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                        ),
                        child: Center(
                          child: Text("3.8",style: TextStyle(color:Colors.white,fontSize: 15,fontStyle: FontStyle.normal,),),
                        )
                      ),
                    ),
                  ),

                  Align(
                    child:   Icon(Icons.bookmark, color: Colors.yellow),
                    alignment: Alignment.bottomLeft,

                  )
                ],

              )
            ],
          ),
        )
    );
  }

}