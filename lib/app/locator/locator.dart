
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:thoughbox_currency_converter/app/locator/locator.config.dart';


final getIt = GetIt.instance;
@InjectableInit()
void configureDependencies() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.init();
}