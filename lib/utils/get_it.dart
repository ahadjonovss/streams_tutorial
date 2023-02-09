import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streams_tutorial/data/repositories/storage_repository.dart';

final getIt = GetIt.instance;

void setup() async {
 final SharedPreferences sharedPref = await SharedPreferences.getInstance();
 getIt.registerLazySingleton(() => StorageRepository());
 getIt.registerSingleton<SharedPreferences>(sharedPref);
}