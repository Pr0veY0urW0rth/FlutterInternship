// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'qr_code_scan_bloc.dart';

class QRCodeScanState extends Equatable {
  const QRCodeScanState(this.capture, this.text, {this.password = ''});

  final BarcodeCapture capture;
  final String password;
  final QRTextEntity text;

  @override
  List<Object> get props => [password, capture, text];

  QRCodeScanState copyWith({
    String? password,
    BarcodeCapture? capture,
    QRTextEntity? text,
  }) {
    return QRCodeScanState(
      password: password ?? this.password,
      capture ?? this.capture,
      text ?? this.text,
    );
  }
}
