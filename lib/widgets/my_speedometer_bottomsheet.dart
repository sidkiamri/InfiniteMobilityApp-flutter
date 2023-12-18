import 'package:ebike/widgets/widget.dart';
import 'package:flutter/material.dart';

class SpeedoMeterBottomSheet extends StatefulWidget {
  const SpeedoMeterBottomSheet({super.key});

  @override
  State<SpeedoMeterBottomSheet> createState() => _SpeedoMeterBottomSheetState();
}

class _SpeedoMeterBottomSheetState extends State<SpeedoMeterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: GestureDetector(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const Positioned(
              // Adjust the top position to move the gauge within the container
              top: 20,
              child: SizedBox(height: 247, child: SpeedGauge()),
            ),
            const Positioned(
              bottom: 50,
              right: -80,
              child: SizedBox(
                height: 110,
                child: TiltLevelGauge(
                  tiltLevel: -30,
                ),
              ),
            ),
            Positioned(
              left: 65,
              bottom: 30,
              child: BatteryStateWidget(
                  batteryStatus:
                      BatteryStatus1(isCharging: true, batteryLevel: 90)),
            ),
            Positioned(bottom: 180, child: PlusMinusButtons()),
          ],
        ),
      ),
    );
  }
}
