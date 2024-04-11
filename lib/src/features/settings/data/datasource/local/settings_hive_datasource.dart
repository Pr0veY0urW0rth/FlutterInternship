import 'package:hive/hive.dart';
import 'package:intership/src/core/utils/constants/hive_boxes.dart';
import 'package:intership/src/core/utils/constants/hive_keys.dart';
import 'package:intership/src/features/settings/data/datasource/local/settings_local_datasource.dart';

class SettingsHiveDatasource extends SettingsLocalDatasource {
  @override
  Future<void> logOut() async {
    await Hive.openBox(userBox);
    var box = Hive.box(userBox);
    await box.delete(userKey);
  }

  @override
  Future<void> addPasswordForData() {
    // TODO: implement addPasswordForData
    throw UnimplementedError();
  }

  @override
  Future<void> changeSupabaseOptionality() {
    // TODO: implement changeSupabaseOptionality
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllData() {
    // TODO: implement deleteAllData
    throw UnimplementedError();
  }

  @override
  Future<void> removePasswordForData() {
    // TODO: implement removePasswordForData
    throw UnimplementedError();
  }
}
