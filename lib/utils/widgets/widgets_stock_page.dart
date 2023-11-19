import 'package:flutter/material.dart';
import 'package:zesdro_task/utils/constants/const.dart';

Widget coinDetailContainer(
    {required BuildContext context,
    required String cSymbol,
    required String cName,
    required String cCurrentPrice,
    Widget? cImage,
    required String cIncrement}) {
  return Container(
    padding: const EdgeInsets.only(top: 18),
    height: MediaQuery.of(context).size.height * 0.15,
    width: double.infinity,
    // color: Colors.red,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.grey,
              child: cImage,
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  hbox,
                  Text(cSymbol,
                      style: coinTextstyle(
                        true,
                      )),
                  Text(cName, style: coinTextstyle(false)),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: [
              hbox,
              Text(cCurrentPrice, style: coinTextstyle(true)),
              Text(cIncrement, style: coinTextstyle(false, true)),
            ],
          ),
        )
      ],
    ),
  );
}

Widget graphContainer(BuildContext context,
    {Color? color, required String text, bool? click}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.04,
    width: MediaQuery.of(context).size.width * 0.13,
    decoration: BoxDecoration(
      color: color,
      // border: Border.all(),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
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
Widget graphParentContainer(BuildContext context, Widget child) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.04,
    width: MediaQuery.of(context).size.width * 0.75,
    padding: const EdgeInsets.all(5),
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 60, 60, 60),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    child: child,
  );
}


Widget overviewContainer(BuildContext context,
    {Color? color, required String text, bool? click}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.045,
    width: MediaQuery.of(context).size.width * 0.2,
    decoration: BoxDecoration(
      color: color,
      // border: Border.all(),
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

Widget overviewParentContainer(BuildContext context, Widget child) {
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

Widget perfomanceText(String text, {bool? isNum}) {
  return Text(
    text,
    style: isNum == true
        ? const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)
        : const TextStyle(color: Color.fromARGB(255, 184, 183, 183)),
  );
}

coinTextstyle([bool? istrue, bool isG = false]) {
  if (istrue == true && isG == false) {
    return const TextStyle(
        fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500);
  } else if (istrue == false && isG == true) {
    return const TextStyle(
        fontSize: 16, color: Colors.green, fontWeight: FontWeight.w300);
  } else {
    return const TextStyle(
        fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w300);
  }
}


