import 'package:ebike/screens/profile_page.dart';
import 'package:ebike/widgets/my_image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const ProfilePage(),
                ));
          },
          icon: SvgPicture.asset(
            'assets/images/back_arrow.svg',
            width: 24,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        title: Row(children: [
          const SizedBox(
            width: 65,
          ),
          Text(
            'Edit Profile',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ]),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 70,
        elevation: 0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const SizedBox(width: 81),
                          ImagePickerWidget(),
                          const MyTextField(
                            hintText: 'New Email',
                            inputType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          const MyTextField(
                            hintText: 'New Phone Number',
                            inputType: TextInputType.phone,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          const MyTextField(
                            hintText: 'Country',
                            inputType: TextInputType.phone,
                          ),
                        ],
                      ),
                    ),
                    MyTextButton(
                      buttonName: 'Confirm',
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const ProfilePage(),
                            ));
                      },
                      bgColor: const Color.fromARGB(255, 247, 116, 116),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 100,
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
