import 'package:flutter/material.dart';
import 'package:foodifi/constants/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget intro(
      String maintitle,
      String subtitle_1,
      String subtitle_2,
      double icon_size1,
      double icon_size2,
      double icon_size3,
      double icon_size4) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 0.6,
              child: FlutterLogo(),
            ),
          ),
          Container(
            height: 20,
          ),
          Center(
            child: Container(
              child: Text(
                maintitle,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 20,
          ),
          Column(
            children: <Widget>[
              Center(
                child: Container(
                  child: Text(subtitle_1,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  alignment: Alignment.center,
                ),
              ),
              Center(
                child: Container(
                  child: Text(subtitle_2,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      )),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          Container(
            height: 70,
          ),
          MaterialButton(
            color: Colors.white,
            elevation: 3,
            child: Text("Login"),
            onPressed: () {},
            minWidth: MediaQuery.of(context).size.width * 0.88,
          ),
          Container(
            height: 100,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisSize: MainAxisSize.min,

              children: <Widget>[
                Icon(
                  Icons.brightness_1,
                  size: icon_size1,
                  color: Colors.white,
                ),
                Icon(Icons.brightness_1, size: icon_size2, color: Colors.white),
                Icon(Icons.brightness_1, size: icon_size3, color: Colors.white),
                Icon(Icons.brightness_1, size: icon_size4, color: Colors.white),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: FiColors.bgColor,
      body: PageView(
        children: <Widget>[
          intro("Quick search", "Set your location to start exploring",
              "restaurants around you", 25, 15, 15, 15),
          intro("Variety of food", "Set your location to start exploring",
              "restaurants around you", 15, 25, 15, 15),
          intro("Search for a place", "Set your location to start exploring",
              "restaurants around you", 15, 15, 25, 15),
          intro("Fast shipping", " Set  your location to start exploring",
              "restaurants around you", 15, 15, 15, 25)
        ],
      ));
}
