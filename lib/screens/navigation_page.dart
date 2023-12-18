import 'package:ebike/utils/constants.dart';
import 'package:ebike/widgets/my_speedometer_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'mapbox_map.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const MapScreen(),
          Positioned(
            top: 40,
            left: 10,
            child: SizedBox(
              height: 50,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: kAccentGreen.withOpacity(0.77),
                child: const Icon(
                  LineAwesomeIcons.home,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: SizedBox(
              height: 50,
              child: FloatingActionButton(
                onPressed: () {
                  _showSpeedoBottomSheet(context);
                },
                backgroundColor: kAccentRed.withOpacity(0.77),
                child: const Icon(
                  Icons.speed,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSpeedoBottomSheet(BuildContext context) {
    // Replace the below Ride object with your static Ride data.
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return const SpeedoMeterBottomSheet();
      },
    );
  }
}
