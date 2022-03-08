import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';

import '../../../../constants.dart';

class EducationDarkCardContent extends StatelessWidget {
  const EducationDarkCardContent();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      HumanitarianIcons.ambulance,
      color: kWhite,
      size: 50.0,
    );
  }
}
