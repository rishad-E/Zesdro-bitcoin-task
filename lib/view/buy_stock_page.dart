import 'package:flutter/material.dart';
import 'package:zesdro_task/utils/constants/const.dart';
import 'package:zesdro_task/utils/widgets/widgets_buy_stock_page.dart';

class BuyStockPage extends StatelessWidget {
  const BuyStockPage({super.key});

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
          onPressed: () => Navigator.pop(context),
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
      body: GestureDetector(
        onTap: () {
          // Unfocus the text field when tapped outside
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.88,
              decoration: const BoxDecoration(
                // color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buyStockDetailContainer(
                    context: context,
                    childW: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.black,
                            ),
                            wbox,
                            buyStockBoldText(
                              "CSymbol",
                            )
                          ],
                        ),
                        Row(
                          children: [
                            buyStockBoldText("C-C Price"),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.autorenew_outlined,
                                  // size: 20,
                                  color: Colors.black,
                                )),
                          ],
                        )
                      ],
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
                        buyStockBoldText("Amount")
                      ],
                    ),
                  ),
                  TextField(
                    decoration: buyStocTextfieldDecor(text: "Shares"),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: TextButton(
                      onPressed: () {},
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
            ),
          ),
        ),
      ),
    );
  }
}
