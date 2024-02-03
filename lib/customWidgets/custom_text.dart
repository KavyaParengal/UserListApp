
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({this.text,
    this.value,
    Key? key}) : super(key: key);
  String? text;
  String? value;
  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(children:[
      TextSpan(text: text,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
      TextSpan(text:value??'not Given',style: const TextStyle(color: Colors.black))
    ]));
  }
}