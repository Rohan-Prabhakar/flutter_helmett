import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'package:flutter_helmett/bluetooth/main.dart';
import 'package:flutter_helmett/model/appliance.dart';
import 'package:flutter_helmett/pages/user_profile_page.dart';
import 'package:flutter_helmett/scopedModel/bluetooth.dart';
import 'package:flutter_helmett/scopedModel/connectedModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:charcode/charcode.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:relative_scale/relative_scale.dart';

double speed= 0.0;

class HomePageBody extends StatefulWidget {
  HomePageBody(this.model);

  final ApplianceModel model;

  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {

  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  late BluetoothConnection connection;
  late BluetoothDevice mydevice;
  String op="00";

  bool isConnectButtonEnabled=true;
  bool isDisConnectButtonEnabled=false;




  void _connect() async  {
    List<BluetoothDevice> devices = [];
    setState(() {
      isConnectButtonEnabled=false;
      isDisConnectButtonEnabled=true;
    });
    devices = await _bluetooth.getBondedDevices();
    // ignore: unnecessary_statements
    devices.forEach((device) {

      print(device);
      if(device.name=="HC-05")
      {
        mydevice=device;
      }
    });

    await BluetoothConnection.toAddress(mydevice.address)
        .then((_connection) {
      print('Connected to the device');

      connection = _connection;});


    connection.input.listen((Uint8List data) {
      print('Arduino Data : ${ascii.decode(data)}');
      setState(() {
        op=ascii.decode(data);


      });
    });

    connection.input.listen(null).onDone(() {

      print('Disconnected remotely!');
    });

  }

  void _disconnect()
  {

    setState(() {
      op="Disconnected";
      isConnectButtonEnabled=true;
      isDisConnectButtonEnabled=false;
    });
    connection.close();
    connection.dispose();

  }


  void initState() {
    _positionStream =
        Geolocator.getPositionStream(locationSettings: LocationSettings(accuracy: LocationAccuracy.best))
            .listen((position) {
          _onSpeedChange(position == null ? 0.0 : (position.speed * 18) / 5); //Converting position speed from m/s to km/hr
        });
    super.initState();
    Future.delayed(Duration.zero, () => _onPress());

  }
  void _onSpeedChange(double newSpeed) {
    setState(() {
      speed = newSpeed;

    });
  }

  @override
  void dispose() {
    _positionStream.cancel();
    super.dispose();
  }
  /// Handle incoming contexts
  void _onPress()async{

    Position position = await _getGeoLocationPosition();

    location ='Lat: ${position.latitude} , Long: ${position.longitude}';
    var speed='${position.speedAccuracy}';
    GetAddressFromLatLong(position);

  }
  String location ='Null, Press Button';
  String Address = 'search';

  late StreamSubscription<Position> _positionStream;


  Future<Position> _getGeoLocationPosition() async {

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


  }

  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}';

    setState(()  {
    });

  }
  Widget _upperContainer() {

    var now = new DateTime.now();
    var formatter = new  DateFormat.yMMMMd('en_US');
    String formattedDate = formatter.format(now);
    return RelativeBuilder(builder: (context, height, width, sy, sx){
      return FlipCard(
        direction: FlipDirection.VERTICAL,

        back: Text(
  "Motorcycles have evolved faster than helmets have. The Kabuto Helmet brings the IOT technology to a safety staple that has remained stagnant for years.  ",textAlign: TextAlign.justify,
  style: GoogleFonts.openSans(

        color: Colors.white,
        fontSize:(18),
        fontWeight: FontWeight.w600),
),
        front: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      formattedDate,
                      style: GoogleFonts.openSans(color: Colors.white,fontSize: sy(10)),
                    ),
                    Text(
                      'Hello Rohan!',
                      style: GoogleFonts.openSans(color: Colors.white, fontSize: sy(18),fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                GestureDetector(
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://store.playstation.com/store/api/chihiro/00_09_000/container/US/en/999/UP1018-CUSA00133_00-AV00000000000015/1553561653000/image?w=256&h=256&bg_color=000000&opacity=100&_version=00_09_000'),
                  ),

                )
              ],
            ),

            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff4a4a84)),
                      borderRadius: BorderRadius.circular(25)),
                  child:AvatarGlow(
                    showTwoGlows: true,
                    endRadius: 80.0,
                    child: Material(     // Replace this child with your own
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor:Color(0xff4a4a84) ,
                        child: Icon(Icons.location_on,color: Colors.white,)

                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[

                        Container(
                          width: MediaQuery.of(context).size.width/1.8,
                          child: Text(

                            '$Address',

                            style: GoogleFonts.openSans(

                                color: Colors.white,
                                fontSize: sy(10),
                                fontWeight: FontWeight.w700),maxLines: 2,  overflow: TextOverflow.ellipsis,

                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),

                      ],
                    ),
                    Text(
                      'Current Location',
                      style: GoogleFonts.openSans(color: Colors.white54, fontSize: 15),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );}
    );
  }

  Widget _roomCategories() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
      ),
    );
  }



  Widget _applianceGrid(ApplianceModel model) {
    return  RelativeBuilder(builder: (context, height, width, sy, sx) {
      return FadeInLeft(
        child: SingleChildScrollView(
          child: Container(
              alignment: Alignment.topCenter,
              // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              height: 400,
              child: GridView.count(
                mainAxisSpacing: 10,
                // crossAxisSpacing: 10,
                crossAxisCount: 2,
                padding: EdgeInsets.all(0),
                children: [
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(
                        horizontal: (5), vertical: (8)),
                    margin: EdgeInsets.fromLTRB(15, 7.5, 7.5, 7.5),


                    decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: <BoxShadow>[
                          BoxShadow(

                              blurRadius: 2,
                              offset: Offset(0, 2),
                              color: Color(0xff669df6)
                          )
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff669df6), Color(0xff4a4a84)]
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.vibration,
                                color: Colors.white
                            ),
                            GestureDetector(onTap: () {},
                                child: Text(
                                  'kg/s³',
                                  style: GoogleFonts.openSans(
                                      color: Color(0xff302e45),
                                      fontSize: sy(8),
                                      fontWeight: FontWeight.w400),
                                ),
                            /*

                  Switch(
                      value: model.allYatch[index].isEnable,
                      activeColor: Color(0xff457be4),
                      onChanged: (_) {
                        setState(() {
                          model.allYatch[index].isEnable =
                          !model.allYatch[index].isEnable;
                        });
                      })*/
                            )],
                        ),

                        Center(

                          child: Row(
                            children: [ Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                op,
                                style: GoogleFonts.openSans(
                                    color: Color(0xff302e45),
                                    fontSize: sy(30),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),

                            ],),
                        ),

                        Container(
                          height: 40,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2,

                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(

                              'Vibration',
                              style: GoogleFonts.openSans(
                                  color: Colors.white
                                  ,
                                  fontSize: sy(10)),
                            ),
                          ),
                        ),
                        // Icon(model.allYatch[index].topRightIcon,color:model.allYatch[index].isEnable ? Colors.white : Color(0xffa3a3a3))

                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(
                        horizontal: (5), vertical: (8)),
                    margin: EdgeInsets.fromLTRB(7.5, 7.5, 15, 7.5),


                    decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: <BoxShadow>[
                          BoxShadow(

                              blurRadius: 2,
                              offset: Offset(0, 2),
                              color: Color(0xff669df6)
                          )
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff669df6), Color(0xff4a4a84)]
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.compress_rounded,
                                color: Colors.white
                            ),
                            GestureDetector(onTap: () {},
                                child: Icon(
                                  Icons.history_outlined,
                                  color: Colors.white,)),
                            /*

                  Switch(
                      value: model.allYatch[index].isEnable,
                      activeColor: Color(0xff457be4),
                      onChanged: (_) {
                        setState(() {
                          model.allYatch[index].isEnable =
                          !model.allYatch[index].isEnable;
                        });
                      })*/
                          ],
                        ),

                        Center(

                          child: Row(
                            children: [ Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                '212',
                                style: GoogleFonts.openSans(
                                    color: Color(0xff302e45),
                                    fontSize: sy(30),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                              Text(
                                'N/m²',
                                style: GoogleFonts.openSans(
                                    color: Color(0xff302e45),
                                    fontSize: sy(8),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],),
                        ),

                        Container(
                          height: 40,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2,

                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(

                              'Pressure',
                              style: GoogleFonts.openSans(
                                  color: Colors.white
                                  ,
                                  fontSize: sy(10)),
                            ),
                          ),
                        ),
                        // Icon(model.allYatch[index].topRightIcon,color:model.allYatch[index].isEnable ? Colors.white : Color(0xffa3a3a3))
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(
                        horizontal: (5), vertical: (8)),
                    margin: EdgeInsets.fromLTRB(15, 7.5, 7.5, 7.5),


                    decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: <BoxShadow>[
                          BoxShadow(

                              blurRadius: 2,
                              offset: Offset(0, 2),
                              color: Color(0xff669df6)
                          )
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff669df6), Color(0xff4a4a84)]
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.local_drink,
                                color: Colors.white
                            ),
                            GestureDetector(onTap: () {},
                                child: Icon(
                                  Icons.history_outlined,
                                  color: Colors.white,)),
                            /*

                  Switch(
                      value: model.allYatch[index].isEnable,
                      activeColor: Color(0xff457be4),
                      onChanged: (_) {
                        setState(() {
                          model.allYatch[index].isEnable =
                          !model.allYatch[index].isEnable;
                        });
                      })*/
                          ],
                        ),

                        Center(

                          child: Row(
                            children: [ Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                '23',
                                style: GoogleFonts.openSans(
                                    color: Color(0xff302e45),
                                    fontSize: sy(30),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                              Text(
                                'mg/l',
                                style: GoogleFonts.openSans(
                                    color: Color(0xff302e45),
                                    fontSize: sy(8),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],),
                        ),

                        Container(
                          height: 40,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2,

                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(

                              'Alcohol',
                              style: GoogleFonts.openSans(
                                  color: Colors.white
                                  ,
                                  fontSize: sy(10)),
                            ),
                          ),
                        ),
                        // Icon(model.allYatch[index].topRightIcon,color:model.allYatch[index].isEnable ? Colors.white : Color(0xffa3a3a3))
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(
                        horizontal: (5), vertical: (8)),
                    margin: EdgeInsets.fromLTRB(7.5, 7.5, 15, 7.5),


                    decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: <BoxShadow>[
                          BoxShadow(

                              blurRadius: 2,
                              offset: Offset(0, 2),
                              color: Color(0xff669df6)
                          )
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff669df6), Color(0xff4a4a84)]
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.speed,
                                color: Colors.white
                            ),
                            GestureDetector(onTap: () {},
                                child: Icon(
                                  Icons.history_outlined,
                                  color: Colors.white,)),
                            /*

                  Switch(
                      value: model.allYatch[index].isEnable,
                      activeColor: Color(0xff457be4),
                      onChanged: (_) {
                        setState(() {
                          model.allYatch[index].isEnable =
                          !model.allYatch[index].isEnable;
                        });
                      })*/
                          ],
                        ),

                        Center(

                          child: Row(
                            children: [ Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                speed.toStringAsFixed(0),
                                style: GoogleFonts.openSans(
                                    color: Color(0xff302e45),
                                    fontSize: sy(30),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                              Text(
                                'km/hr',
                                style: GoogleFonts.openSans(
                                    color: Color(0xff302e45),
                                    fontSize: sy(8),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],),
                        ),

                        Container(
                          height: 40,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2,

                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(

                              'Speed',
                              style: GoogleFonts.openSans(
                                  color: Colors.white
                                  ,
                                  fontSize: sy(10)),
                            ),
                          ),
                        ),
                        // Icon(model.allYatch[index].topRightIcon,color:model.allYatch[index].isEnable ? Colors.white : Color(0xffa3a3a3))
                      ],
                    ),
                  ),


                ],
              )),
        ),
      );

    });
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
      child:RelativeBuilder(builder: (context, height, width, sy, sx) {
        var shouldbe = true;
        return Scaffold(

          appBar: AppBar(toolbarHeight: 100,
              title: Padding(

                  padding: EdgeInsets.fromLTRB(10, 120, 40, 70),
                  child: FadeInLeft(
                    child: Badge(

                        badgeColor: Colors.transparent,

                        borderRadius: BorderRadius.circular(2),
                        badgeContent: FaIcon(
                          FontAwesomeIcons.audible, size: sy(17),),
                        child: FadeInLeft(
                            child: Text('Kabuto', style: GoogleFonts.openSans(
                                fontSize: sy(27),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),))),
                  )),
              backgroundColor: Color(0xff0b102d),
              elevation: 0,
              actions: <Widget>[

                Padding(
                  padding: EdgeInsets.fromLTRB(sx(20), sy(34), 20, 20),
                  child: FadeInLeft(
                    child: Row(
                      children: [
                        Container(child:IconButton(onPressed:isConnectButtonEnabled?_connect:null ,icon: Icon(

                          Icons.bluetooth,
                        ) ,)
                          ,),

                         IconButton(
                        icon: CircleAvatar(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.transparent,
                          child: Badge(
                            badgeColor: Colors.redAccent,
                            badgeContent: Icon(CupertinoIcons.exclamationmark,
                              color: Colors.white,
                              size: sy(5),),
                            child: Icon(Icons.perm_phone_msg,
                              size: sy(18),
                              color: Colors.white,
                            ),),
                        ),
                        onPressed: () {
                          // do something
                        },
                      ),
                      ],),
                  ),
                ),
              ]),

          backgroundColor: Color(0xff0b102d),
          body: ListView(children: <Widget>[
            SizedBox(height: 30,),
            FadeInLeft(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 7.5, 15, 0),
                child: Container(
                  height: 180,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: EdgeInsets.only(
                      top: MediaQuery
                          .of(context)
                          .padding
                          .top / 1.5,
                      bottom: 0,
                      left: 30,
                      right: 30.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff669df6), Color(0xff4a4a84)]),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),

                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: FadeInLeft(child: _upperContainer()),
                ),
              ),
            ),
            _roomCategories(),
            _applianceGrid(widget.model)

          ]),
        );
      }),
    );
  }
}
