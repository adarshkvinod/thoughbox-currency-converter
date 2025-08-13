import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:thoughbox_currency_converter/app/constants/api_constants.dart';
import 'package:thoughbox_currency_converter/app/services/api_service.dart';
import 'package:thoughbox_currency_converter/src/domain/models/conversion_result_model/conversion_result_model.dart';
import '../../../app/services/local_storage_service.dart';
import '../../domain/repositories/currency_repository.dart';

@LazySingleton(as: CurrencyRepository)
class CurrencyRepositoryImplementation implements CurrencyRepository {
  final ApiService api;
  final LocalStorageService localStorage;

  CurrencyRepositoryImplementation(this.api, this.localStorage);

  @override
  Future<ConversionResultModel> getConversionResult({
    required String from,
    required String to,
    required double amount,
  }) async {
    final now = DateTime.now();
    final cached = localStorage.getCachedRate(from, to);

    // Determine if cache is fresh (<5 mins)
    final bool useCache =
        cached != null &&
        now
                .difference(DateTime.parse(cached['fetchedAt'] as String))
                .inMinutes <
            5;

    if (useCache) {
      final rate = cached['rate'] as double;
      return ConversionResultModel(
        from: from,
        to: to,
        amount: amount.toString(),
        result: {to: rate * amount, 'rate': rate},
        ms: 0,
        isCached: true,
        cacheAgeInMinutes: now
            .difference(DateTime.parse(cached['fetchedAt'] as String))
            .inMinutes,
      );
    }

    // Fetch fresh rate from API
    try {
      final queryParams = {
        'from': from,
        'to': to,
        'amount': 1,
        'access_key': ApiConstants.accessKey,
      };

      final response = await api.get(
        ApiEndpoints.conversion,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final rate = data['result']['rate'] as double;

        // Cache fresh rate
        await localStorage.setCachedRate(from: from, to: to, rate: rate);

        return ConversionResultModel(
          from: from,
          to: to,
          amount: amount.toString(),
          result: {to: rate * amount, 'rate': rate},
          ms: data['ms'] ?? 0,
          isCached: false,
          cacheAgeInMinutes: 0,
        );
      } else {
        throw Exception('API failed: ${response.statusMessage}');
      }
    } catch (e, stackTrace) {
      // Fallback to cache if API fails and cache exists
      if (cached != null) {
        final fetchedAt = DateTime.parse(cached['fetchedAt'] as String);
        final diff = now.difference(fetchedAt);
        final rate = cached['rate'] as double;

        log(
          'Using fallback cached rate for $from-$to',
          name: 'CurrencyRepository',
          stackTrace: stackTrace,
        );

        return ConversionResultModel(
          from: from,
          to: to,
          amount: amount.toString(),
          result: {to: rate * amount, 'rate': rate},
          ms: 0,
          isCached: true,
          cacheAgeInMinutes: diff.inMinutes,
        );
      }
      rethrow;
    }
  }
}
