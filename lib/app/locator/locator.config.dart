// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:thoughbox_currency_converter/app/services/api_service.dart'
    as _i119;
import 'package:thoughbox_currency_converter/app/services/local_storage_service.dart'
    as _i590;
import 'package:thoughbox_currency_converter/src/application/auth_bloc/auth_bloc.dart'
    as _i269;
import 'package:thoughbox_currency_converter/src/application/currency_bloc/currency_bloc.dart'
    as _i555;
import 'package:thoughbox_currency_converter/src/application/network_bloc/network_bloc.dart'
    as _i962;
import 'package:thoughbox_currency_converter/src/domain/repositories/currency_repository.dart'
    as _i1027;
import 'package:thoughbox_currency_converter/src/infrastructure/repositories/currency_repository_implementation.dart'
    as _i459;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i269.AuthBloc>(() => _i269.AuthBloc());
    gh.factory<_i962.NetworkBloc>(() => _i962.NetworkBloc());
    gh.lazySingleton<_i119.ApiService>(() => _i119.ApiService());
    gh.lazySingleton<_i590.LocalStorageService>(
      () => _i590.LocalStorageService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i1027.CurrencyRepository>(
      () => _i459.CurrencyRepositoryImplementation(
        gh<_i119.ApiService>(),
        gh<_i590.LocalStorageService>(),
      ),
    );
    gh.factory<_i555.CurrencyBloc>(
      () => _i555.CurrencyBloc(gh<_i1027.CurrencyRepository>()),
    );
    return this;
  }
}
