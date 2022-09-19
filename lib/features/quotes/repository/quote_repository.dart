import '../../../models/models.dart';
import '../../../network/network_helper.dart';
import '../../../network/network_service.dart';

class QuotesRepository {
  final String _baseUrl = "https://api.quotable.io/random";

  Future<QuoteModel> getQuote() async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get, url: _baseUrl);
    return NetworkHelper.filterResponse(
        callBack: (json) => QuoteModel.fromJson(json),
        response: response,
        onFailureCallBackWithMessage: (errorType, msg) =>
            throw Exception("An error has occured. $errorType - $msg"));
  }
}
