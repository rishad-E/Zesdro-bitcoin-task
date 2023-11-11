import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          child: Consumer<StockControllerClass>(
            builder: (context, data, child) {
              final value = data.bitcoin![0];
              return Column(
                children: [
                  coinDetailContainer(
                    context: context,
                    cImage: Image.network(value.image.toString()),
                    cSymbol: value.symbol.toString(),
                    cName: value.name.toString(),
                    cCurrentPrice:
                        data.amoundtoUSD(value.currentPrice!).toString(),
                    cIncrement: data.currentIncre(
                        pchange: value.priceChangePercentage24H!,
                        pchangePer: value.priceChangePercentage24H!),
                  ),
                  Container(
                    height: 300,
                    // color: Colors.green,
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
                                data.amoundtoUSD(value.low24H!, false),
                                isNum: true),
                            perfomanceText(
                                data.amoundtoUSD(value.high24H!, false),
                                isNum: true)
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
                            perfomanceText(data.amoundtoUSD(value.ath!, false),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>  BuyStockPage(
                                        image: value.image.toString(),
                                        cSymbol: value.name.toString(),
                                        currentPrice: data.amoundtoUSD(value.currentPrice!),
                                        cPrice: data.amoundtoDouble(value.currentPrice!),
                                      )));
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
