enum QRCodeScanStatus {
  initial,
  inProgress,
  failure,
  success,
}

extension QRCodeScanStatusX on QRCodeScanStatus {
  bool get isInitial => this == QRCodeScanStatus.initial;

  bool get isInProgress => this == QRCodeScanStatus.inProgress;

  bool get isFailure => this == QRCodeScanStatus.failure;

  bool get isSucces => this == QRCodeScanStatus.success;
}
