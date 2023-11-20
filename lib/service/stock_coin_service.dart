import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:zesdro_task/model/stock_model.dart';
import 'package:zesdro_task/utils/constants/api.dart';

class StockServiceClass {
  Dio dio = Dio();

  final StreamController<List<User>> _bitcoinStreamController =
      StreamController<List<User>>();

  Stream<List<User>> get bitcoinStream => _bitcoinStreamController.stream;

  Future<List<User>?> getBitCoinData() async {
    try {
      Response response = await dio
          .get(Apis().baseUrl, queryParameters: {"vs_currency": "usd"});
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        final res = data.map((e) => User.fromJson(e)).toList();
        log(res.toString());
        _bitcoinStreamController.add(res);
        return res;
      } else {
        throw DioException(
          requestOptions: RequestOptions(),
          response: response,
          error: 'Failed to fetch data',
        );
      }
    } catch (e) {
      log(e.toString(), name: 'service error');
      throw Exception('Couldnot fetch ${e.toString()}');
    }
    // return null;
  }

  void dispose() {
    _bitcoinStreamController.close();
  }
}
