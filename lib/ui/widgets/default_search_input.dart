import 'package:flutter/material.dart';

class DefaultSearchInput extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? obscure;

  const DefaultSearchInput({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        obscureText: obscure!,
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: Colors.indigo,
        style: const TextStyle(fontSize: 14, fontFamily: "Poppins"),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[600]!, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.indigo, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: const Color.fromRGBO(234, 235, 242, 1),
          hintText: hintText,
          filled: true,
          hintStyle: const TextStyle(
              fontSize: 10,
              color: Color.fromARGB(255, 158, 158, 158),
              fontFamily: "Poppins"),
          prefixIcon: Icon(
            icon,
            color: Colors.grey[600],
            size: 18,
          ),
        ),
      ),
    );
  }
}
