import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BatteryStatus1 {
  final bool isCharging;
  final int batteryLevel;

  BatteryStatus1({
    required this.isCharging,
    required this.batteryLevel,
  });
}

class BatteryStateWidget extends StatefulWidget {
  final BatteryStatus1 batteryStatus;

  const BatteryStateWidget({super.key, required this.batteryStatus});

  @override
  State<BatteryStateWidget> createState() => _BatteryStateWidgetState();
}

class _BatteryStateWidgetState extends State<BatteryStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 5,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5), topLeft: Radius.circular(5)),
            color: (widget.batteryStatus.batteryLevel < 20)
                ? kAccentRedLight
                : kAccentLightGreen,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width / 6,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: (widget.batteryStatus.batteryLevel < 20)
                      ? kAccentRedLight
                      : kAccentLightGreen,
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height / 6) *
                    (widget.batteryStatus.batteryLevel / 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: (widget.batteryStatus.batteryLevel < 20)
                      ? kAccentRed
                      : kAccentGreen,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.2), // Shadow color and opacity
                      offset: const Offset(0, 4), // Offset of the shadow
                      blurRadius: 6, // Spread of the shadow
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 60,
                  child: Text(
                    "${widget.batteryStatus.batteryLevel.toInt()}%",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
