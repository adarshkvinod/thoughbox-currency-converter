
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

    // 1️⃣ Use cache if within 5 minutes
    if (cached != null) {
      final fetchedAt = DateTime.parse(cached['fetchedAt'] as String);
      final diff = now.difference(fetchedAt);

      if (diff.inMinutes < 5) {
        print('Returning cached rate for $from-$to');
        final rate = cached['rate'] as double;
        return ConversionResultModel(
          base: from,
          amount: amount.toString(),
          result: {
            to: rate * amount,
            'rate': rate,
          },
          ms: 0,
        );
      } else {
        print('⚠️ Cached rate older than 5 mins');
      }
    }

    // 2️⃣ API call if cache miss or expired
    try {
      final queryParams = {
        'from': from,
        'to': to,
        'amount': 1, // always 1 unit for rate calculation
        'access_key': ApiConstants.accessKey,
      };

      final response = await api.get(ApiEndpoints.conversion, queryParameters: queryParams);

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final rate = data['result']['rate'] as double;

        // 3️⃣ Cache the rate in local storage
        await localStorage.setCachedRate(from: from, to: to, rate: rate);

        return ConversionResultModel(
          base: from,
          amount: amount.toString(),
          result: {
            to: rate * amount,
            'rate': rate,
          },
          ms: data['ms'] ?? 0,
        );
      } else {
        throw Exception('API failed: ${response.statusMessage}');
      }
    } catch (e) {
      // 4️⃣ Fallback to cached rate within 30 minutes
      if (cached != null) {
        final fetchedAt = DateTime.parse(cached['fetchedAt'] as String);
        final diff = now.difference(fetchedAt);
        if (diff.inMinutes <= 30) {
          final rate = cached['rate'] as double;
          print('⚠️ Using fallback cached rate');
          return ConversionResultModel(
            base: from,
            amount: amount.toString(),
            result: {
              to: rate * amount,
              'rate': rate,
            },
            ms: 0,
          );
        }
      }
      rethrow;
    }
  }
}
