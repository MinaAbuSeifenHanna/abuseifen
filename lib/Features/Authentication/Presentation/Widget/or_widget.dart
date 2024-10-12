import 'package:flutter/material.dart';

class ORWidget extends StatelessWidget {
  const ORWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


        const Text(
          'or',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),


      ],
    );
  }
}
