import 'package:flutter/material.dart';
import 'package:foodifi/constants/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: FiColors.bgColor,
        body: Center(),
      );
}
