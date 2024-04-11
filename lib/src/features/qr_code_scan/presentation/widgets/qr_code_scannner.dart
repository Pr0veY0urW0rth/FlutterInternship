import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeScanner extends StatelessWidget {
  const QRCodeScanner({super.key, required this.onDetect});

  final Function(BarcodeCapture) onDetect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: MobileScanner(onDetect: onDetect
          // (capture) {
          //   final List<Barcode> barcodes = capture.barcodes;
          //   for (final barcode in barcodes) {
          //     print(barcode.rawValue ?? "No Data found in QR");
          //   }
          // }
          ),
    );
  }
}
