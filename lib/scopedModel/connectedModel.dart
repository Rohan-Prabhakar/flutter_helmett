import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helmett/model/appliance.dart';
import 'package:flutter_helmett/bluetooth/ChatPage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_helmett/pages/home_page_body.dart';




class  ConnectedModel extends Model{



  List<Appliance> _applianceList = [
     Appliance(
         title :'op',
         value: 'kg/s³',
         subtitle : 'Vibration',
         leftIcon : Icons.vibration,
         topRightIcon : Icons.threesixty,
         bottomRightIcon: Icons.threesixty,
         isEnable : true),
     Appliance(
         title : '469',
         subtitle : 'Pressure',
         value:'N/m²' ,leftIcon : Icons.compress_rounded,
         topRightIcon : Icons.threesixty,
         bottomRightIcon: Icons.threesixty,
         isEnable : true),
     Appliance(
         value: 'mg/l'   ,
     title : '232',
         subtitle : 'Alcohol',
         leftIcon : Icons.local_drink,
         topRightIcon : Icons.router,
         bottomRightIcon: Icons.threesixty,
         isEnable : true),
     Appliance(
         value: 'km/hr',
         title : '$speed',
         subtitle : 'Speed',
         leftIcon : Icons.speed_sharp,
         topRightIcon : Icons.threesixty,
         bottomRightIcon: Icons.threesixty,
         isEnable : true),

  ];


}
class ApplianceModel extends ConnectedModel {
  List<Appliance> get allYatch {
    return List.from(_applianceList);

  }
}