import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streams_tutorial/utils/get_it.dart';

class StorageRepository {

  // Saving data
  Future saveQuestion(String question, int key) async {
    await getIt<SharedPreferences>().setString(key.toString(), question);
    await setLastKey(key);
    debugPrint("Key and Question has saved");
  }


  Future<String?> getQuestion(int key) async {
    return getIt<SharedPreferences>().getString(key.toString());
  }

  Future<bool> setLastKey(int key) async {
    return getIt<SharedPreferences>().setInt("key", key);
  }

  Future<int?> getLastKey() async {
    return getIt<SharedPreferences>().getInt("key");
  }

}