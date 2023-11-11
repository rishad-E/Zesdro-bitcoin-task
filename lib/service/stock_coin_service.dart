import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:zesdro_task/model/stock_model.dart';
import 'package:zesdro_task/utils/constants/api.dart';

class StockServiceClass {
  Dio dio = Dio();

  Future<List<User>?> getBitCoinService() async {
    try {
      Response response = await dio
          .get(Apis().baseUrl, queryParameters: {"vs_currency": "usd"});
      if (response.statusCode == 200) {
        //  log(response.data.toString());
        List<dynamic> data = response.data;
        final res = data.map((e) => User.fromJson(e)).toList();
        log(res.toString());
        return res;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
