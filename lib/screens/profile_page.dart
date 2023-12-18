import 'package:ebike/screens/screen.dart';
import 'package:ebike/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 70,
        elevation: 0,
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
                    const SizedBox(
                      height: 25,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: RoundedImage(
                                imageUrl:
                                    "https://www.sayarti.tn/wp-content/uploads/2022/03/moez-jomaa-infinite-mobility-970x577.jpg"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                            "Moez",
                            style: Theme.of(context).textTheme.displayMedium,
                          )),
                          const SizedBox(height: 25),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => const EditProfile(),
                                    ));
                              },
                              child: const Text("Edit"),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your Personal informations: ",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              CustomProfileRow(
                                  iconName: 'email',
                                  text: "moez@gotoinfinite.com"),
                              CustomProfileRow(
                                  iconName: 'phone', text: "+47 93 00 44 71"),
                              CustomProfileRow(
                                  iconName: 'location',
                                  text: "Møllergata 6, 0179 Oslo, Norway "),
                              const SizedBox(
                                height: 40,
                              ),
                              CustomSettings(
                                  text: "Change Password",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              Change_Password_Screen(),
                                        ));
                                  }),
                              CustomSettings(
                                text: "About us",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => const AboutUs(),
                                      ));
                                },
                              ),
                              CustomLogoutSettings(
                                  text: 'Logout', onPressed: () {})
                            ],
                          )
                        ],
                      ),
                    ),
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
