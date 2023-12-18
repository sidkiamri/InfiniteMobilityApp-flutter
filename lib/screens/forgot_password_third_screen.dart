import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import '../widgets/widget.dart';
import 'screen.dart';

class ForgotPasswordThridScreen extends StatefulWidget {
  ForgotPasswordThridScreen({super.key});

  @override
  State<ForgotPasswordThridScreen> createState() =>
      _ForgotPasswordThridScreenState();
}

class _ForgotPasswordThridScreenState extends State<ForgotPasswordThridScreen> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/images/back_arrow.svg',
            width: 24,
           color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
      ),
      body: SafeArea(
        //to make page scrollable
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reset password",
                          style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Text(
                            "Please type something you will remember .",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          const Text(
                            "New password",
                          ),
                          MyPasswordField(
                            isPasswordVisible: isPasswordVisible,
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Confrim new password",
                          ),
                          MyPasswordField(
                            isPasswordVisible: isPasswordVisible,
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                         MyTextButtonOutline(
                            buttonName: 'Change password',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordFourthScreen(),
                                  ));
                            },
                            textColor: Colors.black87,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account ? ",
                            style: Theme.of(context).textTheme.bodySmall),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SignInPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Log in',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: kAccentBlue),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
