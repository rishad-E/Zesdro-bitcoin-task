import 'dart:async';
import 'package:get/get.dart';
import 'package:zesdro_task/controller/stock_controller.dart';

class SplashController extends GetxController {
  /* a reactive or observable variable for navigation */
  RxBool navigate = false.obs;

  void init() {
    Get.find<StockController>().getBitCoinController();
    splashTimer();
  }

  void splashTimer() {
    Timer(const Duration(seconds: 3), () {
      navigate.value = true;
    });
  }
}
