import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';

import '../../../../constants.dart';
import '../../widgets/icon_container.dart';

class WorkLightCardContent extends StatelessWidget {
  const WorkLightCardContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        IconContainer(
          icon:HumanitarianIcons.road,

          padding: kPaddingS,
        ),
        IconContainer(
          icon: CupertinoIcons.speedometer,
          padding: kPaddingM,
        ),
        IconContainer(
          icon: Icons.nine_k_plus,
          padding: kPaddingS,
        ),
      ],
    );
  }
}
