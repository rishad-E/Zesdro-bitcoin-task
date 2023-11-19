import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zesdro_task/controller/stock_controller.dart';
import 'package:zesdro_task/utils/constants/const.dart';
import 'package:zesdro_task/utils/widgets/widgets_buy_stock_page.dart';

class BuyStockPage extends StatelessWidget {
  final String image;
  final String cSymbol;
  final String currentPrice;
  final double cPrice;

  const BuyStockPage(
      {super.key,
      required this.cSymbol,
      required this.image,
      required this.currentPrice,
      required this.cPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        title: appBarText(),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.question_mark,
            size: 26,
            color: Colors.white,
          ),
          wboxM
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          StockController stockController = Get.put(StockController());
          stockController.resetValues();
          return true;
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Align(
                alignment: Alignment.topCenter,
                child: GetBuilder<StockController>(
                  init: StockController(),
                  builder: (controller) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.88,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buyStockDetailContainer(
                            context: context,
                            childW: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.black,
                                        child: Image.network(image),
                                      ),
                                      wboxM,
                                      buyStockBoldText(cSymbol),
                                      // buyStockBoldText("text")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      buyStockBoldText(currentPrice.toString()),
                                      IconButton(
                                          onPressed: () {
                                            log("reload button");
                                            controller.getBitCoinController();
                                          },
                                          icon: const Icon(
                                            Icons.autorenew_outlined,
                                            size: 30,
                                            color: Colors.black,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          buyStockScndParent(
                            context: context,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                buyStockScndContainer(
                                  context,
                                  text: "Market",
                                  color: Colors.black,
                                  click: true,
                                ),
                                buyStockScndContainer(context, text: "Limit"),
                                buyStockScndContainer(context, text: "Stop"),
                                buyStockScndContainer(context, text: "OTO"),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            // color: Colors.yellow,
                            decoration: buyStockContainerDecor(),
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                noramlText("Amount"),
                                buyStockBoldText(
                                    controller.amountResult(cPrice))
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: buyStockContainerDecor(),
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                noramlText("Shares"),
                                SizedBox(
                                  width: 100,
                                  child: TextField(
                                    textAlign: TextAlign.end,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(color: Colors.white),
                                    decoration:
                                        buyStocTextfieldDecor(text: "Quantity"),
                                    controller: controller.controller,
                                    onChanged: (text) {
                                      controller.updateAmoundResult(cPrice);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        elevation: 30,
                                        backgroundColor: const Color.fromARGB(
                                            255, 172, 168, 168),
                                        title: const Center(
                                            child: Text("Confirm Purchase")),
                                        content: Text(
                                          'Please Ensure before Purchasing the amount  \$${controller.amountResult(cPrice)}',
                                        ),
                                        actions: [
                                          TextButton(
                                              child: const Text(
                                                'No',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              onPressed: () {
                                                Get.back();
                                              }),
                                          TextButton(
                                            child: const Text(
                                              'Yes',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            onPressed: () {
                                              Get.back();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: const Center(
                                child: Text(
                                  "Confirm Purchase",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
