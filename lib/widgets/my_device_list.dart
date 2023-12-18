import 'package:ebike/core/ble/ble_scanner.dart';
import 'package:ebike/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';
import '../core/ble/ble_logger.dart';
import '../core/ble/device_detail/device_detail_screen.dart';

class DeviceListScreen extends StatelessWidget {
  const DeviceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Consumer3<BleScanner, BleScannerState?, BleLogger>(
        builder: (_, bleScanner, bleScannerState, bleLogger, __) => _DeviceList(
          scannerState: bleScannerState ??
              const BleScannerState(
                discoveredDevices: [],
                scanIsInProgress: false,
              ),
          startScan: bleScanner.startScan,
          stopScan: bleScanner.stopScan,
          toggleVerboseLogging: bleLogger.toggleVerboseLogging,
          verboseLogging: bleLogger.verboseLogging,
        ),
      );
}

class _DeviceList extends StatefulWidget {
  const _DeviceList({
    required this.scannerState,
    required this.startScan,
    required this.stopScan,
    required this.toggleVerboseLogging,
    required this.verboseLogging,
  });

  final BleScannerState scannerState;
  final void Function(List<Uuid>) startScan;
  final VoidCallback stopScan;
  final VoidCallback toggleVerboseLogging;
  final bool verboseLogging;

  @override
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<_DeviceList> {
  late TextEditingController _uuidController;
  // DeviceInteractionViewModel viewModel;
  @override
  void initState() {
    _startScanning();
    // !widget.scannerState.scanIsInProgress ? _startScanning : null;
    super.initState();
    _uuidController = TextEditingController()
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    widget.stopScan();
    _uuidController.dispose();
    super.dispose();
  }

  bool _isValidUuidInput() {
    final uuidText = _uuidController.text;
    if (uuidText.isEmpty) {
      return true;
    } else {
      try {
        Uuid.parse(uuidText);
        return true;
      } on Exception {
        return false;
      }
    }
  }

  void _startScanning() {
    widget.startScan([]);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Center(
            child: Column(
          children: [
            Text(
              'Available Devices',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
                width: 160,
                child:
                    LinearProgressIndicator(color: kAccentRed, minHeight: 1)),
          ],
        )),
        content: Material(
          color: Colors.white,
          child: Container(
            height: 250,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Adjust the size according to your needs
                children: [
                  ...widget.scannerState.discoveredDevices
                      .map((device) => (device.connectable ==
                                  Connectable.available) &&
                              (device.name.isNotEmpty)
                          ? ListTile(
                              title: Text(
                                device.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              subtitle: Column(
                                children: [
                                  Text(
                                    """
                ${device.id}
                                """,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const Divider(),
                                ],
                              ),

                              leading: SizedBox(
                                width: 80,
                                child: Image.asset(
                                  "assets/images/INGA_BIKE.png",
                                  fit: BoxFit.fitWidth,
                                ),
                              ), // const Icon(CupertinoIcons.link),
                              onTap: () async {
                                widget.stopScan();
                                await Navigator.push<void>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        DeviceDetailScreen(device: device),
                                  ),
                                );
                              },
                            )
                          : const SizedBox.shrink())
                      .toList(),
                ],
              ),
            ),
          ),
        ),
      );
}
