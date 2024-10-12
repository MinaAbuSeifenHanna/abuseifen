// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';

class RegisterCheck extends StatelessWidget {
  final bool value;
  final String text;
  const RegisterCheck({
    Key? key,
    required this.value,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: value ? Colors.green : Colors.transparent,
              border: value
                  ? Border.all(color: Colors.transparent)
                  : Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(50)),
          child: const Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
              fontFamily: 'Cairo', color: value ? Colors.green : Colors.white),
        )
      ],
    ).setHorizontalAndVerticalPadding(context, 0.08, 0.008);
  }
}
