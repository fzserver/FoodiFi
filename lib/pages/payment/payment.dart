import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodifi/constants/colors.dart';
import 'package:foodifi/pages/payment/BottomSheetModel.dart';
import 'package:foodifi/pages/payment/CurvedClipper.dart';

class Payment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  bool _isVisible = false;
  var _list = ['9234567890123456', '1234567890123456', '8234567890123456'];

  BottomSheetModel bottomSheetModel = BottomSheetModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                  clipper: CurvedClipper(),
                  child: Container(height: 80, color: FiColors.appColor)),
              Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 2, left: 15),
                      child: Row(
                        children: <Widget>[
                          Text("PAYMENT ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ],
                      )),
                ],
              )
            ],
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ClipPath(
                      clipper: CurvedClipper(),
                      child: Container(height: 90, color: Colors.pink)),
                ),
                Container(
                    margin:
                        const EdgeInsets.only(top: 4.0, left: 15, right: 15),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset: Offset(
                              5.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 15, left: 15, right: 15),
                      child: Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("DELIVERY ADDRESS",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                        color: Colors.pink, width: 1)),
                                height: 60,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey[100],
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'ADDRESS #1',
                                                    style: TextStyle(
                                                        color: Colors.pink,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      '4904 Goldener Ranch',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 9),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Colors.pink,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "PAYMENT METHOD",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: _list.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        child: paymentWidget(
                                            _list[index], _isVisible),
                                        onTap: () {
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                          Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "on clicked : ${_list[index]}"),
                                            ),
                                          );
                                        });
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Material(
                                  //Wrap with Material
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  elevation: 18.0,
                                  color: Colors.pink,
                                  clipBehavior: Clip.antiAlias,
                                  // Add This
                                  child: MaterialButton(
                                    height: 45,
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: new Text('Payment',
                                        style: new TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white)),
                                    onPressed: () {
                                      bottomSheetModel.mainBottomSheet(context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ))
        ],
      ),
    );
  }

  paymentWidget(String cardNumber, bool _isVisible) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[100],
        ),
        height: 60,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.pink, width: 1)),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.payment),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "${cardNumber}",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
//                Offstage(
//                  offstage: false,
//                  child: ,
//                ),

                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
