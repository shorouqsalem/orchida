import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrintShelfLabelScreen extends StatefulWidget {
  const PrintShelfLabelScreen({super.key});

  @override
  State<PrintShelfLabelScreen> createState() => _PrintShelfLabelScreenState();
}

class _PrintShelfLabelScreenState extends State<PrintShelfLabelScreen> {
  TextEditingController _barcodeController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shelf Label'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scan Barcode:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _barcodeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter barcode...',
                prefixIcon: IconButton(
                  icon: Icon(Icons.qr_code_scanner),
                  onPressed: () {
                    _scanBarcode();
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            // ... Your existing TextFields for name and price ...

            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement printing functionality
                    printShelfLabel();
                  },
                  child: Text('Print'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Clear the fields
                    _barcodeController.clear();
                    _nameController.clear();
                    _priceController.clear();
                  },
                  child: Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _scanBarcode() async {
  try {
    var options = ScanOptions();
    var result = await BarcodeScanner.scan(options: options);
    setState(() {
      _barcodeController.text = result.rawContent;
    });
  } on PlatformException catch (e) {
    if (e.code == BarcodeScanner.cameraAccessDenied) {
      print('Camera permission denied');
    } else {
      print('Error: $e');
    }
  } on FormatException {
    // User pressed the back button before scanning anything.
    // Handle this situation as you see fit.
  } catch (e) {
    print('Error: $e');
  }
}

  void printShelfLabel() {
    // Implement the printing functionality here.
    // You can use the barcode, name, and price entered by the user
    // to print the shelf label using a Bluetooth printer or any other method.
    // For Bluetooth printing, you can refer to the previous example in this conversation.
    print('Printing shelf label...');


  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:orchidapos/presntation/resources/color_manager.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class PrintShelfLabelScreen extends StatefulWidget {
//   @override
//   State<PrintShelfLabelScreen> createState() => _PrintShelfLabelScreenState();
// }

// class _PrintShelfLabelScreenState extends State<PrintShelfLabelScreen> {
//   FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
//   BluetoothDevice? selectedDevice;

//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   String scannedName = '';
//   double scannedPrice = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     startScan();
//   }

//   void startScan() {
//     flutterBlue.scanResults.listen((results) {
//       // Do something with scan results, e.g., filter devices and show them in a list.
//       List<BluetoothDevice> devices = [];
//       for (ScanResult result in results) {
//         print('${result.device.name} found! rssi: ${result.rssi}');
//         devices.add(result.device); // Add the devices to the list.
//       }
//       // Display the list of available devices in a bottom sheet.
//       _showDeviceList(devices);
//     });

//     flutterBlue.startScan(timeout: Duration(seconds: 4));
//   }

//   void stopScan() {
//     flutterBlue.stopScan();
//   }

//   void selectDevice(BluetoothDevice device) {
//     setState(() {
//       selectedDevice = device;
//       stopScan(); // Stop scanning once a device is selected.
//     });
//   }

//   Future<void> printShelfLabel(String name, double price) async {
//     if (selectedDevice == null) {
//       print('No Bluetooth device selected.');
//       return;
//     }

//     try {
//       // Connect to the selected device
//       await selectedDevice!.connect();

//       // Discover the services of the connected device
//       List<BluetoothService> services = await selectedDevice!.discoverServices();

//       // Find the characteristic for writing data (you need to check your printer's documentation for the correct UUID)
//       BluetoothCharacteristic? characteristic;
//       for (BluetoothService service in services) {
//         for (BluetoothCharacteristic char in service.characteristics) {
//           if (char.properties.write) {
//             characteristic = char;
//             break;
//           }
//         }
//       }

//       if (characteristic == null) {
//         print('Cannot find a writable characteristic for the selected device.');
//         return;
//       }

//       // Implement your Bluetooth communication and print commands here.
//       // For example, if you are using ESC/POS commands:
//       final List<int> command = [27, 64, 10, 13]; // Sample ESC/POS command to print.

//       // Write the command to the characteristic to send it to the printer
//       await characteristic.write(command);

//       // Disconnect from the device after printing
//       await selectedDevice!.disconnect();
//     } catch (e) {
//       print('Error printing: $e');
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   void onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         scannedName = scanData.code!; // Assuming the QR code contains the name.
//         scannedPrice = 10.0; // Assuming a fixed price for demonstration purposes.
//       });
//       controller.pauseCamera();
//     });
//   }

//   void _showDeviceList(List<BluetoothDevice> devices) {
//     showModalBottomSheet<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return ListView.builder(
//           itemCount: devices.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               title: Text(devices[index].name),
//               onTap: () {
//                 selectDevice(devices[index]);
//                 Navigator.pop(context); // Close the bottom sheet after selection.
//               },
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Print Shelf Label"),
//         backgroundColor: ColorManager.primary,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 200,
//               width: 200,
//               child: QRView(
//                 key: qrKey,
//                 onQRViewCreated: onQRViewCreated,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Scanned Name: $scannedName",
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Scanned Price: $scannedPrice",
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 if (controller != null) {
//                   controller!.resumeCamera();
//                   setState(() {
//                     scannedName = '';
//                     scannedPrice = 0.0;
//                   });
//                 }
//               },
//               child: Text("Start Scan"),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 printShelfLabel(scannedName, scannedPrice);
//               },
//               child: Text("Print Shelf Label"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

