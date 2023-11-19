import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zesdro_task/controller/stock_controller.dart';
import 'package:zesdro_task/utils/constants/const.dart';
import 'package:zesdro_task/utils/widgets/widgets_stock_page.dart';
import 'package:zesdro_task/view/buy_stock_page.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.star_rate_rounded,
                color: Colors.blue,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 25,
              )),
          wboxM
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: GetBuilder<StockController>(
            init: StockController(),
            builder: (controller) {
              if (controller.bitcoin == null ||controller.bitcoin!.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              final value = controller.bitcoin![0];
              log(value.currentPrice.toString(),name: 'current price,home');
              return Column(
                children: [
                  coinDetailContainer(
                    context: context,
                    cImage: Image.network(value.image.toString()),
                    cSymbol: value.symbol.toString(),
                    cName: value.name.toString(),
                    cCurrentPrice: controller.amoundtoUSD(value.currentPrice!),
                    cIncrement: controller.currentIncre(
                        pchange: value.priceChange24H!,
                        pchangePer: value.priceChangePercentage24H!),
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            graphParentContainer(
                              context,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  graphContainer(context, text: "1D"),
                                  graphContainer(context, text: "1W"),
                                  graphContainer(context, text: "3M"),
                                  graphContainer(
                                    context,
                                    text: "6M",
                                    color: Colors.black,
                                    click: true,
                                  ),
                                  graphContainer(context, text: "About")
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.11,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 60, 60, 60),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: const Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.fullscreen)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 22),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        overviewParentContainer(
                          context,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              overviewContainer(
                                context,
                                text: "Overview",
                                color: Colors.black,
                                click: true,
                              ),
                              overviewContainer(context, text: "News"),
                              overviewContainer(context, text: "Analytics"),
                              overviewContainer(context, text: "About"),
                            ],
                          ),
                        ),
                        perfomanceText("Perfomance "),
                        hbox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            perfomanceText("Today's Low"),
                            perfomanceText("Today's high")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            perfomanceText(
                                controller.amoundtoUSD(value.low24H!, false),
                                isNum: true),
                            perfomanceText(
                                controller.amoundtoUSD(value.high24H!, false),
                                isNum: true),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            perfomanceText("52 Week Low"),
                            perfomanceText("52 Week High")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            perfomanceText(value.atl.toString(), isNum: true),
                            perfomanceText(
                                controller.amoundtoUSD(value.ath!, false),
                                isNum: true)
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => BuyStockPage(
                                    image: value.image.toString(),
                                    cSymbol: value.name.toString(),
                                    currentPrice: controller
                                        .amoundtoUSD(value.currentPrice!),
                                    cPrice: controller
                                        .amoundtoDouble(value.currentPrice!),
                                  ));
                            },
                            child: const Center(
                              child: Text(
                                "Buy Now",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
