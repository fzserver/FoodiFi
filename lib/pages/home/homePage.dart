import 'package:flutter/material.dart';
import 'package:foodifi/pages/login/loginPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Login(),
      );
}
