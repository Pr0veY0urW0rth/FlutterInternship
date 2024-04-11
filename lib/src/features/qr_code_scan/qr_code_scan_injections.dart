import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/qr_code_scan/domain/usecases/decipher_qr_code_usecase.dart';

initQRCodeScanInjections() {
  sl.registerSingleton<DecipherQRCodeUseCase>(DecipherQRCodeUseCase());
}
