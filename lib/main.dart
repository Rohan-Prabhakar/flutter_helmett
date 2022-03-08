// @dart=2.9
import 'package:flutter_helmett/login.dart';
import 'package:flutter_helmett/navbar.dart';
import 'package:flutter_helmett/screenss/onboarding/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/material.dart';
import 'package:flutter_helmett/navslide.dart';
import 'package:flutter_helmett/scopedModel/connectedModel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'pages/home_page_body.dart';

void main() async {
  runApp(App());
}

class MyApp extends StatelessWidget {
  final ApplianceModel model = ApplianceModel();

  @override
  Widget build(BuildContext context) {
    return  ScopedModel<ApplianceModel>(
      model: model,
      child: MaterialApp(
        title: 'Kabuto',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(model),
      ),);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.model);

  final ApplianceModel model;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xfffcfcfd),
          child:  HomePageBody(widget.model),)
    );
  }
}
