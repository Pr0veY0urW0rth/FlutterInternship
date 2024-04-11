import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TextListQRAlert extends StatelessWidget {
  const TextListQRAlert({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('QR-код'),
        content: SizedBox(
          width: 400,
          height: 400,
          child: QrImageView(
            data: data,
            version: QrVersions.auto,
            size: 320,
            gapless: false,
          ),
        ));
  }
}
