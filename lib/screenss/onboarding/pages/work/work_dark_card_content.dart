import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';

import '../../../../constants.dart';

class WorkDarkCardContent extends StatelessWidget {
  const WorkDarkCardContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(
              Icons.motorcycle,
              color: kWhite,
              size: 32.0,
            ),
          ],
        ),
        const SizedBox(height: kSpaceM),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(
              HumanitarianIcons.registration,
              color: kWhite,
              size: 32.0,
            ),
            Icon(
              Icons.add_moderator,
              color: kWhite,
              size: 32.0,
            ),
            Icon(
              HumanitarianIcons.coordination,
              color: kWhite,
              size: 32.0,
            ),
          ],
        ),
      ],
    );
  }
}
