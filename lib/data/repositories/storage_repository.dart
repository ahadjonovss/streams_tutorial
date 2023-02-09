import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streams_tutorial/utils/get_it.dart';

class StorageRepository {

  // Saving data
  Future saveQuestion(String question, int key) async {
    await getIt<SharedPreferences>().setString(key.toString(), question);
    await setLastKey(key);
    debugPrint("Question: $question has saved");
  }


  Future<String?> getQuestion(int key) async {
    return getIt<SharedPreferences>().getString(key.toString());
  }

  Future setLastKey(int key) async {
    await  getIt<SharedPreferences>().setInt("key", key);
    debugPrint("Key $key has saved");

  }

  Future<int?> getLastKey() async {
    return getIt<SharedPreferences>().getInt("key");
  }

}