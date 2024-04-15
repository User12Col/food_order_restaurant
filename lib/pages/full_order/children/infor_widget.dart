import 'package:flutter/material.dart';
class InforWidget extends StatelessWidget {
  final String title;
  final String content;
  const InforWidget({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
        Text(content, style: TextStyle(),),
      ],
    );
  }
}
