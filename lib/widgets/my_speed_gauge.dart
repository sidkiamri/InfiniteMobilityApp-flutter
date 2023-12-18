import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../utils/constants.dart';

class SpeedGauge extends StatefulWidget {
  const SpeedGauge({super.key});

  @override
  State<SpeedGauge> createState() => _SpeedGaugeState();
}

class _SpeedGaugeState extends State<SpeedGauge> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
        backgroundColor: Colors.transparent,
        enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
              endAngle: 0,
              startAngle: 180,
              minorTicksPerInterval: 0,
              radiusFactor: 1,
              showTicks: false,
              axisLabelStyle: const GaugeTextStyle(color: Colors.transparent),
              axisLineStyle: AxisLineStyle(
                  color: Theme.of(context).primaryColor,
                  thickness: 12,
                  cornerStyle: CornerStyle.bothCurve),
              minimum: 0,
              maximum: 25,
              pointers: const <GaugePointer>[
                RangePointer(
                  value: 12,
                  enableAnimation: true,
                  animationType: AnimationType.easeOutBack,
                  cornerStyle: CornerStyle.bothCurve,
                  animationDuration: 2000,
                  width: 12,
                  color: kAccentBluePale,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('12',
                          style: TextStyle(
                              fontSize: 60,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontWeight: FontWeight.bold)),
                      Text('Speed in Km/h',
                          style: Theme.of(context).textTheme.bodyLarge)
                    ],
                  ),
                  verticalAlignment: GaugeAlignment.center,
                  positionFactor: 0.55,
                  angle: 90,
                )
              ])
        ]);
  }
}
