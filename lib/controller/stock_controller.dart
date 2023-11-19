import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zesdro_task/model/stock_model.dart';
import 'package:zesdro_task/service/stock_coin_service.dart';

class StockController extends GetxController {
  List<User>? bitcoin;
  double buyAmount = 1;
  double shareAmount = 1;
  TextEditingController controller = TextEditingController();
  final StockServiceClass _stockService = StockServiceClass();

  @override
  void onInit() {
    super.onInit();
    _stockService.bitcoinStream.listen((List<User>? data) {
      bitcoin = data;
      update();
    });

    Timer.periodic(const Duration(seconds: 8), (Timer timer) async {
      bitcoin = await _stockService.getBitCoinData();
      update();
    });
  }

  /* Close the stream controller when not needed */
  @override
  void onClose() {
    _stockService.dispose();
    super.onClose();
  }

  /* GetX function to get all the details from the service class */
  Future<void> getBitCoinController() async {
    bitcoin = await _stockService.getBitCoinData();
    update();
  }

  /* GetX function to calculate the amount (i.e., amount = current price * shares) */
  String amountResult(double cPrice) {
    if (controller.text.isEmpty) {
      shareAmount = 1;
    } else {
      shareAmount = double.parse(controller.text);
    }
    buyAmount = shareAmount * cPrice;
    return buyAmount.round().toString();
  }

  /* GetX function to update the total amount dynamically */
  void updateAmoundResult(double cPrice) {
    if (controller.text.isNotEmpty) {
      shareAmount = double.parse(controller.text);
      buyAmount = shareAmount * cPrice;
      update();
    }
  }

  void resetValues() {
    shareAmount = 1;
    buyAmount = 1;
    controller.clear();
    update();
  }

  /* GetX function to convert the last updated date in to a date-month-year format */
  String formatDate(String dateTimeString) {

    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    return formattedDate;
  }

  /* GetX function to convert the amount to double for ease of calculation */
  double amoundtoDouble(double value) {
    double exchangeRate = 83.31;
    double usd = value / exchangeRate;
    return usd.round().toDouble();
  }

  /* GetX function to convert the amount to USD for ease of calculation */
  String amoundtoUSD(double value, [bool isPer = true]) {
    double exchangeRate = 83.31;
    double usd = value / exchangeRate;
    String amount = "\$${usd.toStringAsFixed(2)}";
    String pamound = usd.toStringAsFixed(2);
    return isPer == true ? amount : pamound;
  }

  /* GetX function to calculate the current price increment */
  String currentIncre({required double pchangePer, required double pchange}) {
    double exchangeRate = 83.31;
    double usd = pchange / exchangeRate;
    String perc = "(\$${pchangePer.toStringAsFixed(2)})";
    String amount = "${usd.toStringAsFixed(2)}$perc";
    return amount;
  }
}
