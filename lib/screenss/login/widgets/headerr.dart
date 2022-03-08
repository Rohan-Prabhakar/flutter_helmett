import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/logo.dart';
import 'fade_slide_transition.dart';

class Headerr extends StatelessWidget {
  final Animation<double> animation;

  const Headerr({
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            child: Align(
              widthFactor: 0.7,
              child: const
              Logo(
                color: kBlue,
                size: 48.0,
              ),
            ),
          ),
          const SizedBox(height: kSpaceM),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: Text(
              'Login',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: kBlack, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: kSpaceS),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: Text(
              'Retrieve your account and continue the journey with Kabuto.',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: kBlack.withOpacity(0.5)),
            ),
          ),
        ],
      ),
    );
  }
}
