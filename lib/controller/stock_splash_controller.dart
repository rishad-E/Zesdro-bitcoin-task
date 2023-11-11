import 'dart:async';

import 'package:flutter/material.dart';

import 'package:zesdro_task/view/stock_page_home.dart';

class StockSplashProvider with ChangeNotifier {
  splashTimer(BuildContext context) async {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const StockPage(),
      ));
    });
  }
}
