import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodifi/constants/FFRoutes.dart';
import 'package:foodifi/constants/colors.dart';

class BottomSheetModel {
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            color: Color(0xFF737373),
            child: Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),
                child: Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('''\Thank you for \n\   your order''',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18,
                              color: FiColors.appColor,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '''\You can track you order in \n\   \"My orders\" Section ''',
                        maxLines: 2,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Material(
                            //Wrap with Material
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            elevation: 18.0,
                            color: FiColors.appColor,
                            clipBehavior: Clip.antiAlias, // Add This
                            child: MaterialButton(
                              height: 40,
                              minWidth: MediaQuery.of(context).size.width * 0.6,
                              child: new Text('Track My Order',
                                  style: new TextStyle(
                                      fontSize: 16.0, color: Colors.white)),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, FFRoutes.userhome);
                          },
                          child: Text("Go to Home page"))
                    ],
                  ),
                )),
          );
        });
  }
}
