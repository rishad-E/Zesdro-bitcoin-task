import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zesdro_task/view/stock_page_home.dart';
import 'package:zesdro_task/view/stock_splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/stock_page',
          page: () => const StockPage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const StockSplashScreen(),
    );
  }
}
