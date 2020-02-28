import 'package:flutter/material.dart';
import 'package:foodifi/widgets/subsMenu/subsMenu.dart';
import 'package:foodifi/widgets/titleLarge.dart';

class Subscriptions extends StatefulWidget {
  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) => Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 22.0,
            right: 22.0,
            top: 50.0,
          ),
          child: Column(
            children: <Widget>[
              TitleLarge(
                title: 'Subscriptions',
              ),
              SizedBox(
                height: 20.0,
              ),
              Flexible(
                child: SubsMenu(),
              ),
            ],
          ),
        ),
      );
}
