import 'package:flutter/cupertino.dart';

class  Appliance {

  late  var title;
  String subtitle;
  IconData leftIcon;
  IconData topRightIcon;
  IconData bottomRightIcon;
  bool isEnable;
  String value;
  Appliance({required this.title, required this.subtitle, required this.value, required this.leftIcon, required this.topRightIcon, required this.bottomRightIcon, required this.isEnable});
}

