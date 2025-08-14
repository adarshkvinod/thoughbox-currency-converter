import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thoughbox_currency_converter/app/locator/locator.config.dart';

final getIt = GetIt.instance;
@InjectableInit()
void configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.init();
}
