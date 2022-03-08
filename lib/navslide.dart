import 'package:flutter/material.dart';
import 'package:flutter_helmett/main.dart';
import 'package:flutter_helmett/model/message.dart';
import 'package:flutter_helmett/model/read.dart';
import 'package:flutter_helmett/pages/guide_page.dart';
import 'package:flutter_helmett/pages/user_profile_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/try.dart';

void main() => runApp(slide());

class slide extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new FaIcon(FontAwesomeIcons.motorcycle,),
          title: new Text('Home',style: GoogleFonts.openSans(),)

      ),
      BottomNavigationBarItem(

        icon: new Icon(Icons.person_pin_rounded,),
        title: new Text('Profile',style: GoogleFonts.openSans()),
      ),

      BottomNavigationBarItem(

          icon: Icon(Icons.book,),
          title: Text('Guide',style: GoogleFonts.openSans())
      )
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,

  );

  Widget buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),

      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        MyApp(),
        UserProfilePage(),
        guide(),


      ],
    );
  }

  @override
  void initState() {
    super.initState();
    
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 100), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor:Color(0xff212138),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        unselectedFontSize: 12,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}





