//import 'package:ebike/core/User/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../utils/constants.dart';
import '../screens/screen.dart';
import '../widgets/widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    RoundedImage(
                        imageUrl:
                            "https://static.wixstatic.com/media/f65b2c_200c141babeb4ce9a1694313de172f3b~mv2.png"),
                    const SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        "Get the most out of your E-Bike by connecting in to this app",
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              MyTextButton(
                bgColor: kAccentGreen,
                buttonName: 'Join Now',
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => RegisterPage()));
                },
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextButtonOutline(
                buttonName: 'Sign In',
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => SignInPage(),
                      ));
                },
                textColor: Colors.black87,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Divider(
                          thickness: 1.5,
                          indent: 10,
                          color:
                              Theme.of(context).textTheme.titleMedium!.color)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('or continue with',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  Expanded(
                      child: Divider(
                          thickness: 1.5,
                          endIndent: 10,
                          color:
                              Theme.of(context).textTheme.titleMedium!.color)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.facebook),
                        onPressed: () async {
                          /* try {
                            final LoginResult result =
                                await FacebookAuth.instance.login();
                            print(result.message);
                            if (result.status == LoginStatus.success) {
                              final AccessToken accessToken =
                                  result.accessToken!;
                              final facebookToken = accessToken.token;
                              thirdPartyLogin(facebookToken, 'facebook');
                            } else {
                              // Handle login failure
                            }
                          } catch (e) {
                            // Handle exception
                          }
                    */
                        }),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/google.svg', // Replace this with the path to your Google icon SVG file
                      ),
                      onPressed: () async {
                        /*     try {
                          print("hello google auth ");

                          final GoogleSignInAccount? googleUser =
                              await GoogleSignIn(scopes: [
                            'openid', // Required for ID token
                            'profile',
                            'email',
                          ]).signIn();
                          if (googleUser != null) {
                            print("did not cancel ");
                            print(googleUser);
                            final GoogleSignInAuthentication googleAuth =
                                await googleUser.authentication;
                            final googleToken = googleAuth.idToken;
                            print("google auth token id${googleAuth.idToken} ");
                            thirdPartyLogin(googleToken!, 'google');
                          } else {
                            print("canceled login google ");
                          }
                        } catch (e) {
                          print(e);
                        }*/
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: const Icon(Icons.apple),
                      color: Colors.white,
                      onPressed: () async {
                        /*   try {
                          final AuthorizationCredentialAppleID result =
                              await SignInWithApple.getAppleIDCredential(
                                  scopes: [
                                AppleIDAuthorizationScopes.email,
                                AppleIDAuthorizationScopes.fullName,
                              ]);

                          if (result.state != null) {
                            final appleToken = result.authorizationCode;
                            thirdPartyLogin(appleToken, 'apple');
                          } else {
                            // Handle login failure or cancellation
                          }
                        } catch (e) {
                          // Handle exception
                        }*/
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
