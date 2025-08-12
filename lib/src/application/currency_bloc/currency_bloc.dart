import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../app/constants/status/status.dart';
import '../../domain/models/supported_pairs_model.dart';
import '../../domain/repositories/currency_repository.dart';

part 'currency_event.dart';
part 'currency_state.dart';
part 'currency_bloc.freezed.dart';

@injectable
class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyRepository currencyRepository;
  CurrencyBloc(this.currencyRepository) : super(CurrencyState.initial()) {
    // on<_GetSupportedCurrencyPairs>(_getSupportedCurrencyPairs);
  }

  // FutureOr<void> _getSupportedCurrencyPairs(
  //   _GetSupportedCurrencyPairs event,
  //   Emitter<CurrencyState> emit,
  // ) async {
  //   try {
  //     emit(state.copyWith(getSupportedPairStatus: Status.loading()));
  //     final response = await currencyRepository.getSupportedCurrencyPairs();
  //     emit(
  //       state.copyWith(
  //         getSupportedPairStatus: Status.success(),
  //         supportedCurrencyPairs: response,
  //       ),
  //     );
  //   } catch (e) {
  //     emit(
  //       state.copyWith(
  //         getSupportedPairStatus: Status.failure(e.toString()),
  //       ),
  //     );
  //   }
  // }
}
