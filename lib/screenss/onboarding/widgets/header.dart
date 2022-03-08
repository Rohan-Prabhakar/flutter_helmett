import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/logo.dart';

class Header extends StatelessWidget {
  final VoidCallback onSkip;

  const Header({
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
    ClipRect(
      child:
      ClipRRect(
        child:
        Align(
          widthFactor: 0.8,
          child: IconButton(
          icon: Image.asset('lib/assets/Kabutoo.png'),
          iconSize: 140,

          onPressed: () {},
          ),
        ),
      ),
    ),

        GestureDetector(
          onTap: onSkip,
          child: Text(
            'Skip',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: kWhite,fontSize: 16,
                ),
          ),
        ),
      ],
    );
  }
}
