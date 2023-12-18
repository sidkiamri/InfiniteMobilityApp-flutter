import 'package:ebike/screens/home_details_page.dart';
import 'package:ebike/screens/navigation_page.dart';
import 'package:ebike/screens/profile_page.dart';
import 'package:ebike/screens/service_page.dart';
import 'package:ebike/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
//import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeDetails(),
      NavigationPage(),
      const ServicePage(),
      const ProfilePage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Icon(
              LineAwesomeIcons.home,
              size: 29,
            )),
        activeColorPrimary: kAccentGreyBlueDark,
        inactiveColorPrimary: Theme.of(context).textTheme.bodyLarge!.color,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.location),
        activeColorPrimary: kAccentGreyBlueDark,
        inactiveColorPrimary: Theme.of(context).textTheme.bodyLarge!.color,
        onPressed: (p0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationPage(),
              ));
        },
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.gear),
        activeColorPrimary: kAccentGreyBlueDark,
        inactiveColorPrimary: Theme.of(context).textTheme.bodyLarge!.color,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        activeColorPrimary: kAccentGreyBlueDark,
        inactiveColorPrimary: Theme.of(context).textTheme.bodyLarge!.color,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: false,
      backgroundColor:
          Theme.of(context).bottomAppBarColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12,
    );
  }
}
