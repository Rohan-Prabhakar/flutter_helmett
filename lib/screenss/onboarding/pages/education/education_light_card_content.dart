import 'package:flutter/material.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';

import '../../../../constants.dart';
import '../../widgets/icon_container.dart';

class EducationLightCardContent extends StatelessWidget {
  const EducationLightCardContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        IconContainer(

          icon: HumanitarianIcons.alert,
          padding: kPaddingS,
        ),
        IconContainer(
          icon: HumanitarianIcons.hospital_sign,
          padding: kPaddingM,
        ),
        IconContainer(
          icon: HumanitarianIcons.injured,
          padding: kPaddingS,
        ),
      ],
    );
  }
}
