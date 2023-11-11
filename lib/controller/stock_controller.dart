import 'package:flutter/material.dart';
import 'package:zesdro_task/model/stock_model.dart';
import 'package:zesdro_task/service/stock_coin_service.dart';

class StockControllerClass with ChangeNotifier {
  List<User>? bitcoin;

  Future<void> getBitCoinProvider() async {
    await StockServiceClass().getBitCoinService().then(
          (value) => {
            bitcoin = value,
          },
        );
  }

  amoundtoUSD(double value) {
    double exchangeRate = 83.31;
    double usd = value / exchangeRate;
    return "\$${usd.toStringAsFixed(2)}";
  }
}
