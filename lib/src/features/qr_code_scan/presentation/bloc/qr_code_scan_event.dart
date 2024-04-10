part of 'qr_code_scan_bloc.dart';

abstract class QRCodeScanEvent extends Equatable {
  const QRCodeScanEvent();

  @override
  List<Object?> get props => [];
}

class QRScanned extends QRCodeScanEvent {
  const QRScanned(this.capture);

  final BarcodeCapture capture;

  @override
  List<Object> get props => [capture];
}

class PasswordChanged extends QRCodeScanEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}
