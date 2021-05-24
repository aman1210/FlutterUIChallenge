import 'dart:ui';

import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: Color(0xff4B5378),
        // color: Colors.white,
        width: 1,
      ),
    );
    List<Widget> generateField(
        Image icon, String fName, String placeHolder, bool isObscure,
        [Image? suffixIcon]) {
      return [
        Text(
          fName,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xff2E3249),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextFormField(
            obscureText: isObscure,
            obscuringCharacter: '*',
            initialValue: placeHolder,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(letterSpacing: 1.2),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              prefixIcon: icon,
              suffixIcon: suffixIcon,
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
            ),
          ),
        ),
      ];
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            var socialhandles = Row(
              children: [
                Expanded(child: SizedBox()),
                Expanded(
                    child: Row(
                  children: [
                    Text(
                      'Follow us',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(letterSpacing: 1.1, height: 1.2),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/insta.png'),
                        Image.asset('assets/images/fb.png'),
                        Image.asset('assets/images/twitter.png'),
                      ],
                    ))
                  ],
                )),
              ],
            );
            var signUpButton = Row(
              children: [
                Expanded(child: SizedBox()),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: RadialGradient(
                        colors: [
                          Color(0xff67D9FA),
                          Color(0xff016481),
                        ],
                        center: Alignment.bottomRight,
                        radius: 3,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'SIGN UP',
                          style: Theme.of(context).textTheme.button!.copyWith(
                                letterSpacing: 1.4,
                                height: 1.2,
                              ),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
              ],
            );
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Image.asset('assets/images/logo.png'),
                  SizedBox(
                    height: constraints.maxHeight * 0.03,
                  ),
                  Text(
                    'Sign up',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.01,
                  ),
                  Text(
                    'Already have an account?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white70, letterSpacing: 1.5),
                  ),
                  Text(
                    'Sign in',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.lightBlue,
                          letterSpacing: 1.5,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.04,
                  ),
                  ...generateField(Image.asset('assets/images/user.png'),
                      'Your Name', 'PewDewPie', false),
                  SizedBox(
                    height: constraints.maxHeight * 0.015,
                  ),
                  ...generateField(Image.asset('assets/images/mail.png'),
                      'Your Email', 'pewdiepie@youtube.com', false),
                  SizedBox(
                    height: constraints.maxHeight * 0.015,
                  ),
                  ...generateField(
                      Image.asset('assets/images/key.png'),
                      'Your Password',
                      'PewDewPie',
                      true,
                      Image.asset('assets/images/show.png')),
                  SizedBox(
                    height: constraints.maxHeight * 0.04,
                  ),
                  signUpButton,
                  Expanded(child: SizedBox()),
                  socialhandles,
                  SizedBox(
                    height: constraints.maxHeight * 0.04,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
