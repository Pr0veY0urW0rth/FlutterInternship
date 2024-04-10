import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TextListQRAlert extends StatelessWidget {
  const TextListQRAlert({super.key, required this.header, required this.text});

  final String header;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('QR-код'),
        content: SizedBox(
          width: 400,
          height: 400,
          child: QrImageView(
            data: 'Header: $header \nText: $text',
            version: QrVersions.auto,
            size: 320,
            gapless: false,
          ),
        ));
  }
}
