import 'package:ebike/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
    return Column(
      children: [
        Container(
          height: 133,
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kAccentGreyBlueDark,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Image.asset(
            bikeImage,
            fit: BoxFit.fitHeight,
            //   scale: 0.5,
          ),
        ),
        SizedBox(height: 20),
        // Display bike image slightly outside the container
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1.7 / 3,
              padding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the Row horizontally

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.batteryStatus.distanceLeft.toInt()}',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        " km",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    thickness: 0.2,
                    // Add endIndent to control the end of the divider
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color, // Adjust the color to be more visible
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        children: [
                          ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .color!,
                                BlendMode.srcIn,
                              ),
                              child: Image.asset(
                                'assets/images/solar-panel.png', // Path to your custom icon image
                                width: 27, // Set the width of the icon
                                height: 27, // Set the height of the icon
                              )),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${widget.batteryStatus.distanceLeft.toInt()}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Container(
                        width: 5,
                        height: 40,
                        child: VerticalDivider(
                          thickness: 0.2,
                          // Add endIndent to control the end of the divider
                          color: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .color, // Adjust the color to be more visible
                        ),
                      ),
                      Column(
                        children: [
                          Icon(CupertinoIcons.thermometer,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 27),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${widget.batteryStatus.distanceLeft.toInt()}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 2,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95 / 3,
              height: 133,
              child: SfRadialGauge(
                  backgroundColor: Colors.transparent,
                  enableLoadingAnimation: true,
                  axes: <RadialAxis>[
                    RadialAxis(
                        endAngle: 0,
                        startAngle: 0,
                        minorTicksPerInterval: 0,
                        radiusFactor: 1,
                        showTicks: false,
                        axisLabelStyle:
                            const GaugeTextStyle(color: Colors.transparent),
                        axisLineStyle: AxisLineStyle(
                          color: widget.batteryStatus.batteryLevel < 20
                              ? kAccentRedLight
                              : kAccentLightGreen,
                          thickness: 7,
                        ),
                        minimum: 0,
                        maximum: 100,
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: widget.batteryStatus.batteryLevel.toDouble(),
                            enableAnimation: true,
                            animationType: AnimationType.easeOutBack,
                            cornerStyle: CornerStyle.bothCurve,
                            animationDuration: 2000,
                            width: 7,
                            color: widget.batteryStatus.batteryLevel < 20
                                ? kAccentRed
                                : kAccentGreen,
                          ),
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Text(
                                '${widget.batteryStatus.batteryLevel}%',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      color:
                                          widget.batteryStatus.batteryLevel < 20
                                              ? kAccentRed
                                              : kAccentGreen,
                                    )),
                            verticalAlignment: GaugeAlignment.center,
                            horizontalAlignment: GaugeAlignment.center,
                            positionFactor: 0.1,
                          )
                        ])
                  ]),
            )
          ],
        ),
      ],
    );
  }
}
