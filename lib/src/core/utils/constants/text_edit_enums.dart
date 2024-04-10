enum QRStatus { initial, generating, failure, success }

extension QRStatusX on QRStatus {
  bool get isInitial => this == QRStatus.initial;

  bool get isGenerating => this == QRStatus.generating;

  bool get isFailure => this == QRStatus.failure;

  bool get isSuccess => this == QRStatus.success;
}
