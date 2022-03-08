import 'package:animate_do/animate_do.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_helmett/model/message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';



class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<StatefulWidget> {
  SolidController _controller = SolidController();


  Widget  _placeContainer(String title, Color color,bool leftIcon){
    return Column(children: <Widget>[
      Container(
          height: 60,
          width: MediaQuery.of(context).size.width - 40,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              color:color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,style: TextStyle(color: leftIcon ? Color(0xffa3a3a3) : Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),

            ],)
      )
    ],);
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBack(

        onFirstBackPress: (context) {
          // you can use your custom here
          // change this with your custom action
          final snackBar =
          SnackBar(content: Text('Press back again to exit'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // ---
        },
      child: RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Scaffold(

            resizeToAvoidBottomInset: true, //use this

            backgroundColor: Color(0xff0b102d),

            body: FadeInUp(
              child: SingleChildScrollView(

                child: Container(
                  color: Color(0xff0b102d),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: EdgeInsets.fromLTRB(30.0, 40, 40, 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Text(
                          'Profile',
                          style: GoogleFonts.openSans(fontSize: sy(27),
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  offset: Offset(10, 15),
                                  color: Color(0x22000000),
                                  blurRadius: 20.0)
                            ],
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://store.playstation.com/store/api/chihiro/00_09_000/container/US/en/999/UP1018-CUSA00133_00-AV00000000000015/1553561653000/image?w=256&h=256&bg_color=000000&opacity=100&_version=00_09_000'))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Rohan Prabhakar',
                        style: GoogleFonts.openSans(fontSize: sy(20),
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Text(
                          '@' + 'username',
                          style: GoogleFonts.openSans(fontSize: sy(12),
                              fontWeight: FontWeight.bold,
                              color: Color(0xff669df6)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 70,),
                      IntrinsicHeight(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(mainAxisAlignment: MainAxisAlignment
                                .spaceAround,
                                children: [
                                  Text('Bajaj Pulsar',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white, fontSize: sy(12))),
                                  SizedBox(height: 10,),
                                  Text('MODEL', style: GoogleFonts.openSans(
                                      color: Color(0xff669df6),
                                      fontSize: sy(10),
                                      fontWeight: FontWeight.bold))
                                ]),
                            Transform.scale(
                              scale: 1,
                              child: VerticalDivider(color: Colors.white,
                                thickness: 2, width: 20,
                              ),
                            ),

                            Column(mainAxisAlignment: MainAxisAlignment
                                .spaceAround,
                                children: [
                                  Text('DL2CK8169', style: GoogleFonts.openSans(
                                      color: Colors.white, fontSize: sy(12))),
                                  SizedBox(height: 10,),
                                  Text('HSRP', style: GoogleFonts.openSans(
                                      color: Color(0xff669df6),
                                      fontSize: sy(10),
                                      fontWeight: FontWeight.bold))
                                ]),


                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                        child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Divider(
                                      color: Colors.transparent, endIndent: 10)
                              ),

                              Container(

                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.5,
                                child: FloatingActionButton(
                                  elevation: 10,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.redAccent),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        useRootNavigator: true,

                                        isScrollControlled: true,
                                        backgroundColor: Color(0xff0b102d),
                                        shape: (RoundedRectangleBorder(

                                          side: BorderSide(
                                              color: Colors.redAccent,
                                              width: 0.2),

                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(10.0)),
                                        )),
                                        context: context,
                                        builder: (context) {
                                          return Container(

                                            height:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.35,
                                            child: Container(

                                              height: 30,
                                              child: Center(
                                                child: ListView(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .center,
                                                        children: [

                                                          Icon(Icons
                                                              .health_and_safety,
                                                            color: Colors
                                                                .redAccent,
                                                            size: sy(15),),
                                                          Text(
                                                            'Emergency Contacts',
                                                            textAlign: TextAlign
                                                                .center,

                                                            style: GoogleFonts
                                                                .openSans(
                                                                color: Colors
                                                                    .redAccent,
                                                                fontSize: sy(15)),
                                                          ),
                                                        ],),
                                                    ),

                                                    Padding(
                                                      padding: EdgeInsets
                                                          .fromLTRB(
                                                          20, 30, 20, 5),

                                                      child: Row(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .spaceBetween,
                                                          children: <Widget>[
                                                            Text(
                                                              "Gaurav Dobhal",
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: sy(12),
                                                                  fontWeight: FontWeight
                                                                      .w600),),

                                                            Text("9810788721",
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: sy(12)),),


                                                          ]
                                                      ),
                                                    ),
                                                    SizedBox(height: 20,),
                                                    Padding(
                                                      padding: EdgeInsets
                                                          .fromLTRB(
                                                          20, 5, 20, 5),

                                                      child: Row(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .spaceBetween,
                                                          children: <Widget>[


                                                            Text("Mridul Vij",
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: sy(12),
                                                                  fontWeight: FontWeight
                                                                      .w600),),

                                                            Text("2121211211",
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: sy(12)),),

                                                          ]
                                                      ),

                                                    ),
                                                    SizedBox(height: 60,),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      children: [

                                                        CircleAvatar(
                                                          backgroundColor: Colors
                                                              .white,
                                                          radius: 22.0,
                                                          child: CircleAvatar(
                                                              radius: 20,
                                                              backgroundColor: Color(
                                                                  0xff0b102d),
                                                              child: IconButton(
                                                                icon: Icon(Icons
                                                                    .edit_rounded),
                                                                color: Color(
                                                                    0xff669df6),
                                                                onPressed: () {
                                                                  showModalBottomSheet(
                                                                      useRootNavigator: true,
                                                                      isScrollControlled: true,
                                                                      backgroundColor: Color(
                                                                          0xff0b102d),
                                                                      shape: (RoundedRectangleBorder(

                                                                        side: BorderSide(
                                                                            color: Colors
                                                                                .redAccent,
                                                                            width: 0.2),

                                                                        borderRadius: new BorderRadius
                                                                            .all(
                                                                            new Radius
                                                                                .circular(
                                                                                10.0)),
                                                                      )),
                                                                      context: context,
                                                                      builder: (
                                                                          context) {
                                                                        
                                                                        
                                                                        return AnimatedPadding(
                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                          duration: const Duration(milliseconds: 100),
                                                                          curve: Curves.decelerate,
                                                                          child: Container(

                                                                            height:
                                                                            MediaQuery
                                                                                .of(
                                                                                context)
                                                                                .size
                                                                                .height *
                                                                                0.35,
                                                                            child: Container(

                                                                              height: 30,
                                                                              child: Center(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,

                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsets
                                                                                          .all(
                                                                                          10),
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment
                                                                                            .center,
                                                                                        children: [

                                                                                          Icon(
                                                                                            Icons
                                                                                                .edit,
                                                                                            color: Colors
                                                                                                .redAccent,
                                                                                            size: sy(15),),
                                                                                          Text(
                                                                                            'Edit Contacts',
                                                                                            textAlign: TextAlign
                                                                                                .center,

                                                                                            style: GoogleFonts
                                                                                                .openSans(
                                                                                                color: Colors
                                                                                                    .redAccent,
                                                                                                fontSize: sy(15)),
                                                                                          ),
                                                                                        ],),
                                                                                    ),

                                                                                    Padding(
                                                                                      padding: EdgeInsets
                                                                                          .fromLTRB(
                                                                                          10,
                                                                                          15,
                                                                                          10,
                                                                                          2.5),

                                                                                      child: Row(
                                                                                          mainAxisAlignment: MainAxisAlignment
                                                                                              .spaceBetween,
                                                                                          children: <
                                                                                              Widget>[


                                                                                            Container(
                                                                                              color: Color(
                                                                                                  0xff0b102d),
                                                                                              height: 40,
                                                                                              width: 180,
                                                                                              child: TextFormField(
                                                                                                initialValue: "Gaurav Dobhal",
                                                                                                style: GoogleFonts
                                                                                                    .openSans(
                                                                                                    color: Colors
                                                                                                        .white,
                                                                                                    fontSize: sy(12),
                                                                                                    fontWeight: FontWeight
                                                                                                        .w600),

                                                                                                decoration: new InputDecoration(
                                                                                                    focusedBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                                                                                    ),
                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(color: Color(0xff669df6), width: 1.0),
                                                                                                    ),

                                                                                                    fillColor: Color(
                                                                                                        0xff0b102d)),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              color: Color(
                                                                                                  0xff0b102d),
                                                                                              height: 40,
                                                                                              width: 150,
                                                                                              child: TextFormField(
                                                                                                initialValue: "9810788721",
                                                                                                style: GoogleFonts
                                                                                                    .openSans(
                                                                                                    color: Colors
                                                                                                        .white,
                                                                                                    fontSize: sy(12),
                                                                                                    fontWeight: FontWeight
                                                                                                        .w600),

                                                                                                decoration: new InputDecoration(
                                                                                                    focusedBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                                                                                    ),
                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(color: Color(0xff669df6), width: 1.0),
                                                                                                    ),
                                                                                                    fillColor: Color(
                                                                                                        0xff0b102d)),
                                                                                              ),
                                                                                            )

                                                                                          ]
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 10,),
                                                                                    Padding(
                                                                                      padding: EdgeInsets
                                                                                          .fromLTRB(
                                                                                          10,
                                                                                          3.5,
                                                                                          10,
                                                                                          2.5),

                                                                                      child: Row(
                                                                                          mainAxisAlignment: MainAxisAlignment
                                                                                              .spaceBetween,
                                                                                          children: <
                                                                                              Widget>[


                                                                                            Container(
                                                                                              color: Color(
                                                                                                  0xff0b102d),
                                                                                              height: 40,
                                                                                              width: 150,
                                                                                              child: TextFormField(
                                                                                                initialValue: "Mridul Vij",
                                                                                                style: GoogleFonts
                                                                                                    .openSans(
                                                                                                    color: Colors
                                                                                                        .white,
                                                                                                    fontSize: sy(12),
                                                                                                    fontWeight: FontWeight
                                                                                                        .w600),

                                                                                                decoration: new InputDecoration(
                                                                                                    focusedBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                                                                                    ),
                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(color: Color(0xff669df6), width: 1.0),
                                                                                                    ),
                                                                                                    fillColor: Color(
                                                                                                        0xff0b102d)),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              color: Color(
                                                                                                  0xff0b102d),
                                                                                              height: 40,
                                                                                              width: 150,
                                                                                              child: TextFormField(
                                                                                                initialValue: "2121211211",
                                                                                                style: GoogleFonts
                                                                                                    .openSans(
                                                                                                    color: Colors
                                                                                                        .white,
                                                                                                    fontSize: sy(12),
                                                                                                    fontWeight: FontWeight
                                                                                                        .w600),

                                                                                                decoration: new InputDecoration(
                                                                                                    focusedBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                                                                                    ),
                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(color: Color(0xff669df6), width: 1.0),
                                                                                                    ),

                                                                                                    fillColor: Color(
                                                                                                        0xff0b102d)),
                                                                                              ),
                                                                                            ),
                                                                                          ]
                                                                                      ),

                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 60,),

                                                                                    CircleAvatar(
                                                                                      radius: 22,
                                                                                      backgroundColor: Colors
                                                                                          .white,
                                                                                      child: CircleAvatar(
                                                                                          radius: 20,
                                                                                          backgroundColor: Color(
                                                                                              0xff0b102d),
                                                                                          child: IconButton(
                                                                                            icon: Icon(
                                                                                                Icons
                                                                                                    .checklist_sharp),
                                                                                            color: Color(
                                                                                                0xff669df6),
                                                                                            onPressed: () {},)),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),),
                                                                        );
                                                                      });
                                                                },)),
                                                        ),
                                                        SizedBox(width: 20,),
                                                        CircleAvatar(
                                                          radius: 22,
                                                          backgroundColor: Colors
                                                              .white,
                                                          child: CircleAvatar(
                                                              radius: 20,
                                                              backgroundColor: Color(
                                                                  0xff0b102d),
                                                              child: IconButton(
                                                                icon: Icon(
                                                                    Icons.add),
                                                                color: Color(
                                                                    0xff669df6),
                                                                onPressed: () {},)),
                                                        ),
                                                      ],),
                                                  ],
                                                ),
                                              ),
                                            ),);
                                        });
                                  },

                                  child: Text("Emergency Contacts",
                                    style: GoogleFonts.openSans(
                                        color: Colors.redAccent,
                                        fontSize: sy(12)),),),
                              ),

                              Expanded(
                                  child: Divider(
                                    color: Colors.transparent, indent: 10,)
                              ),
                            ]
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
}
