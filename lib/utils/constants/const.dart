import 'package:flutter/material.dart';

const hbox = SizedBox(height: 5);
const wbox = SizedBox(width: 5);

const hboxM = SizedBox(height: 15);
const wboxM = SizedBox(width: 15);
Widget noramlText(String text) {
  return Text(
    text,
    style: const TextStyle(
        color: Color.fromARGB(255, 122, 121, 121), fontSize: 16,),
  );
}
