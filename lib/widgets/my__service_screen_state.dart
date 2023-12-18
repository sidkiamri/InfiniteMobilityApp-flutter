import 'package:flutter/material.dart';

enum CustomState {
  normal,
  batteryError,
  gearboxError,
  motorError,
}

class ServiceScreenState extends StatelessWidget {
  final CustomState state;

  ServiceScreenState({required this.state});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    String title;
    String description;
    IconData icon;

    switch (state) {
      case CustomState.normal:
        backgroundColor = Color.fromARGB(164, 54, 216, 48);
        title = 'Ready to ride';
        description = 'Everything works fine';
        icon = Icons.check_circle_outline_outlined;
        break;
      case CustomState.batteryError:
        backgroundColor = Colors.red;
        title = 'Battery Error';
        description = 'Battery too hot !';
        icon = Icons.battery_alert;
        break;
      case CustomState.gearboxError:
        backgroundColor = Colors.red;
        title = 'Gearbox Error';
        description = 'Check your gearbox';
        icon = Icons.warning;
        break;
      case CustomState.motorError:
        backgroundColor = Colors.red;
        title = 'Motor Error';
        description = 'Check your motor';
        icon = Icons.warning;
        break;
    }

    return Container(
      height: 72,
      width: 360,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
