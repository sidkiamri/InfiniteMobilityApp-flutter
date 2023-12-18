import 'package:ebike/screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/widget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
            // ignore: deprecated_member_use
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        title: Row(children: [
          const SizedBox(
            width: 65,
          ),
          Text(
            'About us',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ]),
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
                  children: [
                    const SizedBox(height: 40),
                    RoundedImage(
                        imageUrl:
                            "https://static.wixstatic.com/media/f65b2c_200c141babeb4ce9a1694313de172f3b~mv2.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Proudly made in Oslo, Norway",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                        "We are a Norwegian tech company. We design and manufacture light-weight electric vehicles powered by Solar PhotoVoltaic (PV) cells for Last-Mile Delivery and Urban Mobility sectors."),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "Contact us At :",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(height: 10),
                        CustomProfileRow(
                            iconName: 'phone', text: "+216 925327689"),
                        const SizedBox(
                          width: 80,
                        ),
                        CustomProfileRow(iconName: 'location', text: "Tunisia")
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(height: 10),
                        CustomProfileRow(
                            iconName: 'phone', text: "+47 93004471"),
                        const SizedBox(
                          width: 95,
                        ),
                        CustomProfileRow(iconName: 'location', text: "Norway")
                      ],
                    ),
                    const SizedBox(
                      width: 95,
                    ),
                    CustomProfileRow(
                        iconName: 'email', text: "info@infinite-m.com")
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
