import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TiltLevelGauge extends StatefulWidget {
  final double tiltLevel;

  const TiltLevelGauge({required this.tiltLevel});

  @override
  _TiltLevelGaugeState createState() => _TiltLevelGaugeState();
}

class _TiltLevelGaugeState extends State<TiltLevelGauge> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
          minimum: -100, // Minimum tilt level
          maximum: 100, // Maximum tilt level
          showLabels: false, // Hide axis labels
          showTicks: true, // Show axis ticks
          radiusFactor: 1,
          startAngle: 10,
          endAngle: 170, // Gauge starts from 120 degrees and ends at 60 degrees
          axisLineStyle: const AxisLineStyle(
            thickness: 0.1, // Adjust the thickness of the gauge
            color: Color.fromARGB(
                158, 33, 149, 243), // Color of the gauge background (axe)
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle:
                CornerStyle.bothCurve, // Curve the ends of the gauge axis
          ),
          majorTickStyle: const MajorTickStyle(
            length: 1, // Length of major ticks
            thickness: 2, // Thickness of major ticks
            color: Colors.white, // Color of major ticks
          ),
          minorTickStyle: const MinorTickStyle(
            length: 0.03, // Length of minor ticks
            thickness: 1, // Thickness of minor ticks
            color: Colors.grey, // Color of minor ticks
          ),
          pointers: <GaugePointer>[
            MarkerPointer(
              value: widget.tiltLevel,
              markerType: MarkerType
                  .triangle, // Set the marker type to triangle (arrow)
              color: Colors.white, // Color of the arrow
              markerHeight: 10, // Adjust the height of the arrow
              markerWidth: 15, // Adjust the width of the arrow
              markerOffset:
                  20, // Adjust the position of the arrow (from the inside)
              offsetUnit: GaugeSizeUnit.logicalPixel,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Text(
                '  ${widget.tiltLevel.toStringAsFixed(0)}°', // Display tilt level value as text
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              angle: 90, // Adjust the angle to position the annotation
              positionFactor:
                  0, // Adjust the positionFactor to position the annotation
            ),
            GaugeAnnotation(
              widget: Text(
                  'Tilt degree', // Display "0" at the center for 0-degree position
                  style: Theme.of(context).textTheme.bodyMedium),
              angle: 270, // Adjust the angle to position the annotation
              positionFactor:
                  0.6, // Set the positionFactor to position the annotation at the center
              axisValue:
                  0, // Set the axisValue to position the annotation at the center
            ),
          ],
        ),
      ],
    );
  }
}
