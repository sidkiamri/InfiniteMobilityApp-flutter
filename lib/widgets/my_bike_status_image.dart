import 'package:flutter/material.dart';

enum ImageState {
  normal,
  batteryError,
  gearboxError,
  motorError
} // Add more states if needed

class BikeImageStatus extends StatelessWidget {
  final ImageState state;

  BikeImageStatus({required this.state});

  @override
  Widget build(BuildContext context) {
    String imagePath = getImagePathFromState(state);

    return Image.asset(
      imagePath,
      fit: BoxFit.fitWidth,
      // Add other image properties as needed
    );
  }

  String getImagePathFromState(ImageState state) {
    switch (state) {
      case ImageState.normal:
        return 'assets/images/LOKKA_BIKE_case_normal.png';
      case ImageState.batteryError:
        return 'assets/images/LOKKA_BIKE_case_battery_error.gif';
      case ImageState.gearboxError:
        return 'assets/images/LOKKO_BIKE_case_gearbox_error.gif';
      case ImageState.motorError:
        return 'assets/images/LOKKO_BIKE_case_motor_error.gif';
      // Add cases for other states and their corresponding images
      default:
        return 'assets/images/LOKKA_BIKE_case_normal.png'; // Default image path
    }
  }
}
