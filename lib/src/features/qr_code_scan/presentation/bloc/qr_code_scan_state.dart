part of 'qr_code_scan_bloc.dart';

class QRCodeScanState extends Equatable {
  const QRCodeScanState(
      {this.barcodesList = const [],
      this.text,
      this.status = QRCodeScanStatus.initial,
      this.password = ''});

  final List<Barcode> barcodesList;
  final String password;
  final QRCodeScanStatus status;
  final TextEntity? text;

  @override
  List<Object?> get props => [barcodesList, password, text, status];

  QRCodeScanState copyWith({
    List<Barcode>? barcodesList,
    String? password,
    TextEntity? text,
    QRCodeScanStatus? status,
  }) {
    return QRCodeScanState(
      barcodesList: barcodesList ?? this.barcodesList,
      password: password ?? this.password,
      text: text ?? this.text,
      status: status ?? this.status,
    );
  }
}
