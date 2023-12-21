import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Email'),
        TextField(
          controller: TextEditingController(),
          decoration:  InputDecoration(
             border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
              hintText: 'Email',
              ),
        ),
      ],
    );
  }
}