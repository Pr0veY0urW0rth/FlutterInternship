import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership/src/core/utils/constants/qr_code_scan_enums.dart';
import 'package:intership/src/features/qr_code_scan/domain/usecases/decipher_qr_code_usecase.dart';
import 'package:intership/src/shared/domain/entities/text.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'qr_code_scan_event.dart';
part 'qr_code_scan_state.dart';

class QRCodeScanBloc extends Bloc<QRCodeScanEvent, QRCodeScanState> {
  QRCodeScanBloc({required DecipherQRCodeUseCase decipherQRCodeUseCase})
      : _decipherQRCodeUseCase = decipherQRCodeUseCase,
        super(const QRCodeScanState()) {
    on<QRScanned>(_onQRScanned);
    on<PasswordChanged>(_onPasswordChanged);
  }

  final DecipherQRCodeUseCase _decipherQRCodeUseCase;

  void _onQRScanned(QRScanned event, Emitter<QRCodeScanState> emit) {
    emit(state.copyWith(status: QRCodeScanStatus.inProgress));
    final List<Barcode> list = event.capture.barcodes;
    String result = '';
    list.forEach((element) {
      result += ' ${element.rawValue}';
    });
    print(result);

    emit(state.copyWith(text: TextEntity.fromJson(result)));
    print("Header: ${state.text?.header} text: ${state.text?.text}");

    emit(state.copyWith(status: QRCodeScanStatus.success));
    // _decipherQRCodeUseCase.call();
  }

  void _onPasswordChanged(
      PasswordChanged event, Emitter<QRCodeScanState> emit) {}
}
