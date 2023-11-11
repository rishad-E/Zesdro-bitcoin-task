import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zesdro_task/controller/stock_controller.dart';
import 'package:zesdro_task/controller/stock_splash_controller.dart';
import 'package:zesdro_task/view/stock_splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StockSplashProvider()),
        ChangeNotifierProvider(create: (context) => StockControllerClass())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const StockSplashScreen(),
      ),
    );
  }
}
