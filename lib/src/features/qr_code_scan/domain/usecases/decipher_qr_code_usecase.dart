import 'package:intership/src/core/utils/usecases/usecase.dart';
import 'package:intership/src/features/qr_code_scan/domain/entities/qr_text.dart';

class DecipherQRCodeUseCase extends UseCase<QRTextEntity, String> {
  @override
  Future<QRTextEntity> call({String? params}) async {
    // TODO: implement DecipherQRCodeUseCase.call
    throw UnimplementedError();
  }
}
