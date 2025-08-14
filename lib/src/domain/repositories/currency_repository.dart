
import '../models/conversion_result_model/conversion_result_model.dart';

abstract class CurrencyRepository{
  Future<ConversionResultModel> getConversionResult({
    required String from,
    required String to,
    required double amount,

});


}