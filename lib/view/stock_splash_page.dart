// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zesdro_task/controller/stock_controller.dart';
import 'package:zesdro_task/controller/stock_splash_controller.dart';

class StockSplashScreen extends StatelessWidget {
  const StockSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StockController stockController = Get.put(StockController());
    final SplashController splashController = Get.put(SplashController());
    splashController.init();
    return Obx(
      () {
        if (splashController.navigate.value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.offNamed('/stock_page');
          });
        }
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: SizedBox(
              width: 300,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 300,
                    height: 350,
                    child: Image.asset(
                      "assets/images/stock_image.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text(
                    "Welcome to the world of digital coin",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
