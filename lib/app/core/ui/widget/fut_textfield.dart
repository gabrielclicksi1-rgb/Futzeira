import 'package:flutter/material.dart';

class FutTextfield extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool? obscureText;
  const FutTextfield({
    super.key,
    this.obscureText,
    required this.controller,
    required this.label,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
       labelText: label,
       prefixIcon: Icon(Icons.person),
       border: OutlineInputBorder(),
      ),
    );
  }
}