import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zesdro_task/model/stock_model.dart';
import 'package:zesdro_task/service/stock_coin_service.dart';

class StockControllerClass with ChangeNotifier {
  List<User>? bitcoin;
  double buyAmount = 1;
  double shareAmount = 1;
  TextEditingController controller = TextEditingController();

/* provider function to get all the details from the service class*/
  Future<void> getBitCoinProvider() async {
    await StockServiceClass().getBitCoinService().then(
          (value) => {
            bitcoin = value,
          },
        );
    notifyListeners();
  }

/* provider function to calculate the amound (ie amound = current price * shares)*/

  amountResult(double cPrice) {
    if (controller.text.isEmpty) {
      shareAmount = 1;
    } else {
      shareAmount = double.parse(controller.text);
    }
    buyAmount = shareAmount * cPrice;
    return buyAmount.round().toString();
  }

/* provider function to update the total amound dynamically*/

  void updateAmoundResult(double cPrice) {
    if (controller.text.isNotEmpty) {
      // amountResult(cPrice);
      shareAmount = double.parse(controller.text);
      buyAmount = shareAmount * cPrice;
      notifyListeners();
    }
  }

  void resetValues() {
    shareAmount = 1;
    buyAmount = 1;
    controller.clear();
    notifyListeners();
  }

/* provider function to convert the amound to double for ease of calculation */

  amoundtoDouble(double value) {
    double exchangeRate = 83.31;
    double usd = value / exchangeRate;
    log(usd.toString());
    return usd.round().toDouble();
  }

/* provider function to convert the amound to USD for ease of calculation */
  amoundtoUSD(double value, [bool isPer = true]) {
    double exchangeRate = 83.31;
    double usd = value / exchangeRate;
    String amound = "\$${usd.toStringAsFixed(2)}";
    String pamound = usd.toStringAsFixed(2);
    return isPer == true ? amound : pamound;
  }


/* provider function to calculate the current price increment */
  String currentIncre({required double pchangePer, required double pchange}) {
    double exchangeRate = 83.31;
    double usd = pchange / exchangeRate;
    String perc = "(\$${pchangePer.toStringAsFixed(2)})";
    String amount = "${usd.toStringAsFixed(2)}$perc";
    return amount;
  }
}
