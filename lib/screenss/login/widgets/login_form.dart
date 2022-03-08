import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helmett/navslide.dart';
import 'package:flutter_helmett/screenss/login/register.dart';

import '../../../constants.dart';
import 'custom_button.dart';
import 'custom_input_field.dart';
import 'fade_slide_transition.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;

  const LoginForm({
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        children: <Widget>[
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: const CustomInputField(
              label: ' Email',
              prefixIcon: Icons.person,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
            child: const CustomInputField(
              label: 'Password',
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),     FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
            child: const CustomInputField(
              label: 'OTP',
              prefixIcon: CupertinoIcons.asterisk_circle,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 4 * space,
            child: CustomButton(
              color:Color(0xff669df6),
              textColor: kWhite,
              text: 'Create a Kabuto Account',
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => slide()),
                );
              },
            ),
          ),

          SizedBox(height: 2 * space),
          Row(
              children: <Widget>[
                Expanded(
                    child: Divider(thickness: 1,)
                ),

                Text("OR"),

                Expanded(
                    child: Divider(thickness: 1,)
                ),
              ]
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: CustomButton(
              color: kBlue,
              textColor: kWhite,
              text: 'Login to continue',
              onPressed: (

                  
                  ) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => register(screenHeight:MediaQuery.of(context).size.height)),
                );
              },
            )
          ),
        ],
      ),
    );
  }
}
