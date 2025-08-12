import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/application/auth_bloc/auth_bloc.dart';
import '../../src/application/currency_bloc/currency_bloc.dart';
import '../locator/locator.dart';

List<BlocProvider> kBlocProviders = [
  BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
  BlocProvider<CurrencyBloc>(create: (context) => getIt<CurrencyBloc>()),
];
