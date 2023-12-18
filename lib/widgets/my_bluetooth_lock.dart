import 'package:ebike/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/ble/ble_permission.dart';
import 'my_device_list.dart';

class CustomLockSwitchWidget extends StatefulWidget {
  @override
  _CustomLockSwitchWidgetState createState() => _CustomLockSwitchWidgetState();
}

class _CustomLockSwitchWidgetState extends State<CustomLockSwitchWidget> {
  PermissionController permissionController = PermissionController();
  bool permissionB = false;

  bool _isSwitchOn = true;

  void _toggleSwitch() {
    setState(() {
      _isSwitchOn = !_isSwitchOn;
    });
  }

  Future<void> startScanning() async {
// Inside an async function, for example, a button click handler or a lifecycle method
    bool permission = await permissionController.enableBluetooth();
    setState(() {
      permissionB = permission;
      print(permissionB);
    });

    if (permissionB) {
      await showDeviceListDialog();
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            icon: const Icon(
              CupertinoIcons.xmark_circle,
              color: kAccentRed,
              size: 40,
            ),
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Center(
              child: Text(
                "Bleutooth Disabled",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            content: Text(
              "Enable your Bluetooth to connect your bike !",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: startScanning,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kAccentBlue,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.bluetooth,
                      color: kBackgroundColorContrast,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 7),
              Text(
                "Pair Bike",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          GestureDetector(
            onTap: _toggleSwitch,
            child: Container(
              width: 140,
              height: 40,
              decoration: BoxDecoration(
                color: _isSwitchOn ? kAccentGreen : kBackgroundColorContrast,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      !_isSwitchOn ? 'Locked' : 'Unlocked',
                      style: TextStyle(
                        color: _isSwitchOn ? Colors.white : kAccentRed,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 260),
                    alignment: _isSwitchOn
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        _isSwitchOn
                            ? CupertinoIcons.lock_open
                            : CupertinoIcons.lock,
                        color: _isSwitchOn ? kAccentGreen : kAccentRed,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showDeviceListDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const DeviceListScreen();
      },
    );
  }
}
