import 'package:flutter/material.dart';
import 'package:zesdro_task/utils/constants/const.dart';

Widget buyStockBoldText(String text) {
  return Text(
    text,
    style: const TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
  );
}

Widget buyStockDetailContainer(
    {required BuildContext context, required Widget childW}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.12,
    width: MediaQuery.of(context).size.width * 0.88,
    // padding: const EdgeInsets.all(5),
    decoration: const BoxDecoration(
      color: Colors.grey,
      // color: Color.fromARGB(255, 60, 60, 60),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: childW,
  );
}

Widget appBarText() {
  return const Column(
    children: [
      Text(
        "Buy Stock",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      Text(
        "Meta Platform Inc",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w300, color: Colors.grey),
      )
    ],
  );
}

Widget buyStockScndContainer(BuildContext context,
    {Color? color, required String text, bool? click}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.045,
    width: MediaQuery.of(context).size.width * 0.2,
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: click == true
            ? const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)
            : const TextStyle(color: Color.fromARGB(255, 184, 183, 183)),
      ),
    ),
  );
}

Widget buyStockScndParent(
    {required BuildContext context, required Widget child}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.05,
    width: MediaQuery.of(context).size.width * 0.88,
    padding: const EdgeInsets.all(5),
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 60, 60, 60),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: child,
  );
}

InputDecoration buyStocTextfieldDecor({Widget? prefixW, required String text}) {
  return InputDecoration(
    // hintText: "Amount",

    prefix:noramlText(text),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromARGB(255, 204, 220, 232)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromARGB(255, 204, 220, 232)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromARGB(255, 204, 220, 232)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromARGB(255, 204, 220, 232)),
    ),
  );
}

BoxDecoration buyStockContainerDecor() {
  return BoxDecoration(
    border: Border.all(color: const Color.fromARGB(255, 204, 220, 232)),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );
}
