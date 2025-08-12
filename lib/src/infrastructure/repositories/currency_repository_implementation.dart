import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:thoughbox_currency_converter/app/services/api_service.dart';
import '../../domain/models/supported_pairs_model.dart';
import '../../domain/repositories/currency_repository.dart';

@LazySingleton(as: CurrencyRepository)
class CurrencyRepositoryImplementation implements CurrencyRepository {
  final ApiService api;

  CurrencyRepositoryImplementation(this.api, );

  // @override
  // Future<SupportedPairsModel> getSupportedCurrencyPairs() async {
  //   const String url = 'https://www.freeforexapi.com/api/live';
  //
  //   try {
  //     final response = await api.get(url);
  //
  //     print('Received response with status code: ${response.statusCode}');
  //     print('Response data: ${response.data}');
  //
  //     if (response.statusCode == 200) {
  //       final supportedPairData  = SupportedPairsModel.fromJson(response.data);
  //
  //       print('Extracted supported pairs: ${supportedPairData.supportedPairs}');
  //       return supportedPairData;
  //     } else {
  //       print(
  //         'Failed to load supported currency pairs. Status: ${response.statusCode}',
  //       );
  //       throw Exception('Failed to load supported currency pairs');
  //     }
  //   } catch (e) {
  //     print('Exception occurred while fetching supported pairs: $e');
  //     throw Exception('Error fetching supported pairs: $e');
  //   }
  // }
}