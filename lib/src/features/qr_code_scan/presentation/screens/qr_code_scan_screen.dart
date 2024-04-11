import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/qr_code_scan/domain/usecases/decipher_qr_code_usecase.dart';
import 'package:intership/src/features/qr_code_scan/presentation/bloc/qr_code_scan_bloc.dart';
import 'package:intership/src/features/qr_code_scan/presentation/widgets/qr_code_scan_body.dart';

class QRCodeScanScreen extends StatelessWidget {
  const QRCodeScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (context) {
            return QRCodeScanBloc(
                decipherQRCodeUseCase: sl.get<DecipherQRCodeUseCase>());
          },
          child: const QRCodeScanBody(),
        ),
      ),
    );
  }
}
