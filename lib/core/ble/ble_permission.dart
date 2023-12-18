import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController {
  final FlutterReactiveBle _ble = FlutterReactiveBle();

  Future<bool> isBluetoothEnabled() async {
    final state = await _ble.statusStream.first;
    print(state);
    return state == BleStatus.ready;
  }

  Future<bool> enableBluetooth() async {
    // Request Bluetooth and location permissions
    var bluetoothPermissionStatus = await Permission.bluetooth.request();
    var locationPermissionStatus = await Permission.locationWhenInUse.request();

    print('Bluetooth Permission Status: $bluetoothPermissionStatus');
    print('Location Permission Status: $locationPermissionStatus');

    if (bluetoothPermissionStatus.isGranted &&
        locationPermissionStatus.isGranted) {
      final bleStatus = await _ble.statusStream.first;
      print('BLE Status: $bleStatus');

      if (bleStatus == BleStatus.ready) {
        return true; // Bluetooth permission and location permission granted, BLE status is ready
      }
    }

    print('Bluetooth Permission Not Granted or BLE Status Not Ready');
    return false;
  }
}
