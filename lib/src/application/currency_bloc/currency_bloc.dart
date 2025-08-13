import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thoughbox_currency_converter/src/domain/models/conversion_result_model/conversion_result_model.dart';

import '../../../app/constants/status/status.dart';
import '../../domain/repositories/currency_repository.dart';

part 'currency_event.dart';
part 'currency_state.dart';
part 'currency_bloc.freezed.dart';

@injectable
class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyRepository currencyRepository;
  CurrencyBloc(this.currencyRepository) : super(CurrencyState.initial()) {
    on<_GetConversionResult>(_getConversionResultEvent);
  }

  FutureOr<void> _getConversionResultEvent(_GetConversionResult event, Emitter<CurrencyState> emit) async{
    try {
      emit(state.copyWith(getConversionResultStatus: Status.loading()));
      final conversionResultData = await currencyRepository.getConversionResult(
        from: event.from,
        to: event.to,
        amount: event.amount,
      );
      emit(
        state.copyWith(
          getConversionResultStatus: Status.success(),
          conversionResult: conversionResultData,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getConversionResultStatus: Status.failure(e.toString()),
        ),
      );
    }
  }
}
