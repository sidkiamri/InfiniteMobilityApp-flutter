import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants.dart';
import '../widgets/widget.dart';
import 'screen.dart';

class ForgotPasswordFristScreen extends StatefulWidget {
  ForgotPasswordFristScreen({super.key});

  @override
  State<ForgotPasswordFristScreen> createState() =>
      _ForgotPasswordFristScreenState();
}

class _ForgotPasswordFristScreenState extends State<ForgotPasswordFristScreen> {
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
                            "Forgot password ?",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                              "Don't worry! It happens. Please enter the email associated with your account.",
                              style: Theme.of(context).textTheme.bodySmall),
                          SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Email address",
                          ),
                          MyTextField(
                            hintText: 'Enter your email address',
                            inputType: TextInputType.text,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MyTextButtonOutline(
                            buttonName: 'Send code',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordSecondScreen(),
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
                        Text(
                          "Remember password? ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SignInPage(),
                              ),
                            );
                          },
                          child: Text('Log in',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: kAccentBlue)),
                        ),
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
