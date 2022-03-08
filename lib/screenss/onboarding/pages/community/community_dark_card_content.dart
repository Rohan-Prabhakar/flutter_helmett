import 'package:flutter/material.dart';

import '../../../../constants.dart';

class CommunityDarkCardContent extends StatelessWidget {
  const CommunityDarkCardContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(top: kPaddingL),
          child: Icon(
            Icons.add_road,
            color: kWhite,
            size: 32.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: kPaddingL),
          child: Icon(
            Icons.motorcycle,
            color: kWhite,
            size: 32.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: kPaddingL),
          child: Icon(
            Icons.traffic,
            color: kWhite,
            size: 32.0,
          ),
        ),
      ],
    );
  }
}
