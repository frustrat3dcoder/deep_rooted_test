import "package:http/http.dart" as http;

abstract class BTCDataService {
  Future<http.Response> getBtcValueByType({required String? btcType});
  Future<http.Response> getOrderBookRecords({required String? btcType});
}
