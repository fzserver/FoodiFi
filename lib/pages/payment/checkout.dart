import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodifi/constants/colors.dart';
import 'package:foodifi/pages/payment/CurvedClipper.dart';
import 'package:foodifi/pages/payment/SubscriptionTypes.dart';
import 'package:foodifi/utils/strings.dart';

class CheckOut extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CheckOutPageState();
}

class CheckOutPageState extends State<CheckOut> {
  String mealType = '';
  String mealTime = '';

  String radioItemHolder = '3-Days Subscription';
  int id = 1;
  List<SubscriptionTypes> _list;

  @override
  void initState() {
    super.initState();
    _list = SubscriptionTypes.nList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
              clipper: CurvedClipper(),
              child: Container(height: 100, color: FiColors.appColor)),
          Column(
            //   mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 5, left: 15),
                  child: Row(
                    children: <Widget>[
                      Text("CHECK OUT ",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                  alignment: Alignment.topLeft,
                  height: MediaQuery.of(context).size.height * 0.22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[200]),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 5, left: 15),
                          child: Row(
                            children: <Widget>[
                              Text("Meal Type",
                                  style: TextStyle(
                                    fontSize: 12,
                                  )),
                            ],
                          )),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: RadioListTile(
                                dense: false,
                                groupValue: mealType,
                                title: Text("${Strings.VEG}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                value: '${Strings.VEG}',
                                onChanged: (val) {
                                  setState(() {
                                    mealType = val;
                                  });
                                  print(mealType);
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: RadioListTile(
                                dense: false,
                                groupValue: mealType,
                                title: Text("${Strings.NONVEG}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                value: '${Strings.NONVEG}',
                                onChanged: (val) {
                                  setState(() {
                                    mealType = val;
                                  });
                                  print(mealType);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 5, left: 15),
                          child: Row(
                            children: <Widget>[
                              Text("Meal Time", style: TextStyle(fontSize: 12)),
                            ],
                          )),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: RadioListTile(
                                groupValue: mealTime,
                                title: Text("${Strings.BREAKFAST}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                value: '${Strings.BREAKFAST}',
                                onChanged: (val) {
                                  setState(() {
                                    mealTime = val;
                                  });
                                  print(mealTime);
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: RadioListTile(
                                groupValue: mealTime,
                                title: Text("${Strings.LUNCH}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                value: '${Strings.LUNCH}',
                                onChanged: (val) {
                                  setState(() {
                                    mealTime = val;
                                  });
                                  print(mealTime);
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: RadioListTile(
                                groupValue: mealTime,
                                title: Text("${Strings.DINNER}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                value: '${Strings.DINNER}',
                                onChanged: (val) {
                                  setState(() {
                                    mealTime = val;
                                  });
                                  print(mealTime);
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Container(
                    margin:
                        const EdgeInsets.only(top: 25.0, left: 20, right: 20),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[200]),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 10, left: 15),
                              child: Text(
                                "Subscription Type:",
                                style: TextStyle(fontSize: 15),
                              )),
                          Column(
                              children: _list
                                  .map((data) => RadioListTile(
                                        title: Text("${data.subscriptionType}"),
                                        subtitle:
                                            Text("${data.subscriptionPrice}"),
                                        groupValue: id,
                                        value: data.subscriptionId,
                                        onChanged: (val) {
                                          setState(() {
                                            radioItemHolder =
                                                data.subscriptionType;
                                            id = data.subscriptionId;
                                          });

                                          print(radioItemHolder);
                                        },
                                      ))
                                  .toList()),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 12),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Material(
                    //Wrap with Material
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    color: Colors.greenAccent[400],
                    clipBehavior: Clip.antiAlias, // Add This
                    child: MaterialButton(
                      height: 45,
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      child: new Text('PAYMENT',
                          style: new TextStyle(
                              fontSize: 16.0, color: Colors.white)),
                      onPressed: () {},
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
