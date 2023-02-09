import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {

  // Saving data
  Future<bool> savePassword(String password) async {
    return getIt<SharedPreferences>().setString("password", password);
  }

  Future<bool> deletePassword() async {
    return getIt<SharedPreferences>().remove("password");
  }

  Future<String?> getPassword() async {
    return getIt<SharedPreferences>().getString("password");
  }

  Future<bool> setStatus() async {
    return getIt<SharedPreferences>().setString("status", "registered");
  }

  Future<String?> getStatus() async {
    return getIt<SharedPreferences>().getString("status");
  }

}