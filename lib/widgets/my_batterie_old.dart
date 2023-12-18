/*import 'package:ebike/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BatteryStatus {
  final double distanceLeft;
  final String batteryTimeLeft;
  final bool isCharging;
  final int batteryLevel;

  BatteryStatus({
    required this.distanceLeft,
    required this.batteryTimeLeft,
    required this.isCharging,
    required this.batteryLevel,
  });
}

class BatteryStatusContainer extends StatefulWidget {
  final BatteryStatus batteryStatus;

  BatteryStatusContainer({required this.batteryStatus});

  @override
  _BatteryStatusContainerState createState() => _BatteryStatusContainerState();
}

class _BatteryStatusContainerState extends State<BatteryStatusContainer> {
  String bikeImage =
      'assets/images/bike_image.png'; // Replace with the actual path of your bike image

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: (widget.batteryStatus.batteryLevel < 20)
                  ? kAccentRedLight
                  : kAccentLightGreen,
            ),
          ),
          Container(
            height: 150,
            width: (MediaQuery.of(context).size.width - 40) *
                (widget.batteryStatus.batteryLevel / 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: (widget.batteryStatus.batteryLevel < 20)
                  ? kAccentRed
                  : kAccentGreen,
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.black.withOpacity(0.2), // Shadow color and opacity
                  offset: const Offset(0, 4), // Offset of the shadow
                  blurRadius: 6, // Spread of the shadow
                ),
              ],
            ),
          ),
          // Display bike image slightly outside the container
          Positioned(
            left: 160,
            top: 90,
            child: Image.asset(
              bikeImage,
              width: 180,
            ),
          ),
          Positioned(
            left: 20,
            top: 20,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.batteryStatus.distanceLeft.toInt()} ",
                    style: kHeadline,
                  ),
                  Text(
                    "km",
                    style: kBodyText,
                  ),
                  SizedBox(
                    width: 190,
                  ),
                  const Icon(CupertinoIcons.battery_full),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${widget.batteryStatus.batteryLevel.toInt()}%",
                    style: kBodyText,
                  )
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Temp",
                        style: kInfoTextblack,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "90",
                        style: kInfoText,
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        "ppv",
                        style: kInfoTextblack,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "90",
                        style: kInfoText,
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ],
              ),
              Text(
                widget.batteryStatus.isCharging
                    ? "Charging Now"
                    : "Not Charging",
                style: kBodyText,
              )
            ]),
          )
        ],
      ),
    );
  }
}
*/