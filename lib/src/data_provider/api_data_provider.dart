import 'package:deep_rooted_test/src/service/btc_data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiDataProvider extends BTCDataService {
  String _baseUrl = "https://www.bitstamp.net/api/v2/";
  @override
  Future<http.Response> getBtcValueByType({required String? btcType}) {
    final response = http.get(Uri.parse(_baseUrl + "ticker/$btcType"),
        headers: {"Content-type": "Application/json"});

    debugPrint("Url is " + _baseUrl + "ticker/$btcType");
    response.then(
        (value) => debugPrint("data os ${value.body} and ${value.statusCode}"));

    return response;
  }

  @override
  Future<http.Response> getOrderBookRecords({required String? btcType}) {
    final response = http.get(Uri.parse(_baseUrl + "order_book/$btcType"),
        headers: {"Content-type": "Application/json"});
    response.then(
        (value) => debugPrint("data os ${value.body} and ${value.statusCode}"));
    return response;
  }
}
