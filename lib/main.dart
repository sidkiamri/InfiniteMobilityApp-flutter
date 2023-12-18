import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';
import 'core/ble/ble_device_connector.dart';
import 'core/ble/ble_device_interactor.dart';
import 'core/ble/ble_logger.dart';
import 'core/ble/ble_scanner.dart';
import 'core/ble/ble_status_monitor.dart';
import 'utils/constants.dart';
import './screens/screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final _ble = FlutterReactiveBle();
  final _bleLogger = BleLogger(ble: _ble);
  final _scanner = BleScanner(ble: _ble, logMessage: _bleLogger.addToLog);
  final _monitor = BleStatusMonitor(_ble);
  final _connector = BleDeviceConnector(
    ble: _ble,
    logMessage: _bleLogger.addToLog,
  );
  final _serviceDiscoverer = BleDeviceInteractor(
    bleDiscoverServices: _ble.discoverServices,
    readCharacteristic: _ble.readCharacteristic,
    writeWithResponse: _ble.writeCharacteristicWithResponse,
    writeWithOutResponse: _ble.writeCharacteristicWithoutResponse,
    subscribeToCharacteristic: _ble.subscribeToCharacteristic,
    logMessage: _bleLogger.addToLog,
  );
  runApp(
    MultiProvider(providers: [
      Provider.value(value: _scanner),
      Provider.value(value: _monitor),
      Provider.value(value: _connector),
      Provider.value(value: _serviceDiscoverer),
      Provider.value(value: _bleLogger),
      StreamProvider<BleScannerState?>(
        create: (_) => _scanner.state,
        initialData: const BleScannerState(
          discoveredDevices: [],
          scanIsInProgress: false,
        ),
      ),
      StreamProvider<BleStatus?>(
        create: (_) => _monitor.state,
        initialData: BleStatus.unknown,
      ),
      StreamProvider<ConnectionStateUpdate>(
        create: (_) => _connector.state,
        initialData: const ConnectionStateUpdate(
          deviceId: 'Unknown device',
          connectionState: DeviceConnectionState.disconnected,
          failure: null,
        ),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Bike',
      theme: lightThemeData, // You can start with light theme
      darkTheme: darkThemeData,

      home: const WelcomePage(),
    );
  }
}
