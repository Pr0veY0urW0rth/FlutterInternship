import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intership/src/core/router/app_router.dart';
import 'package:intership/src/core/utils/constants/qr_code_scan_enums.dart';
import 'package:intership/src/features/qr_code_scan/presentation/bloc/qr_code_scan_bloc.dart';
import 'package:intership/src/features/qr_code_scan/presentation/widgets/qr_code_scannner.dart';

class QRCodeScanBody extends StatelessWidget {
  const QRCodeScanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QRCodeScanBloc, QRCodeScanState>(
        listener: (context, state) => {
              if (state.status.isSucces)
                {
                  context.goNamed(AppRouter.textDetailsPath, pathParameters: {
                    'header': state.text!.header,
                    'text': state.text!.text
                  })
                }
            },
        builder: (context, state) {
          return Column(
            children: [
              Gap(10),
              state.status.isInitial
                  ? QRCodeScanner(
                      onDetect: (capture) => context
                          .read<QRCodeScanBloc>()
                          .add(QRScanned(capture)))
                  : state.status.isInProgress
                      ? const CircularProgressIndicator()
                      : Text('data'),
              Gap(10)
            ],
          );
        });
  }
}
