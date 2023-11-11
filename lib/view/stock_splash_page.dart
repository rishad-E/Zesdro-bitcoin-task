import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zesdro_task/controller/stock_controller.dart';
import 'package:zesdro_task/controller/stock_splash_controller.dart';

class StockSplashScreen extends StatelessWidget {
  const StockSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StockControllerClass>(context, listen: false)
          .getBitCoinProvider();
      log('Post frame callback executed');
    });
    Provider.of<StockSplashProvider>(context, listen: false)
        .splashTimer(context);
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
  }
}
