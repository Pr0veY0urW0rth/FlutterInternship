import 'package:hive/hive.dart';
import 'package:intership/src/core/utils/constants/hive_boxes.dart';
import 'package:intership/src/core/utils/constants/hive_keys.dart';
import 'package:intership/src/features/auth/data/datasources/local/auth_local_datasource.dart';

class AuthHiveDatasource extends AuthLocalDatasource {
  @override
  Future<void> signIn(String token) async {
    await Hive.openBox(userBox);
    var box = Hive.box(userBox);
    await box.put(userKey, token);
  }
}
