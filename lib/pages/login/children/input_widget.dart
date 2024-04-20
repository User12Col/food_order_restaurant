import 'package:flutter/material.dart';
class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final isPass;
  final IconData icon;
  const InputWidget({Key? key, required this.controller, required this.hint, required this.isPass, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      width: MediaQuery.of(context).size.width/1.65,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPass,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.grey,),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
