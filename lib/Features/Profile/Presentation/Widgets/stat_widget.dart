import 'package:flutter/material.dart';

class StatWidget extends StatelessWidget {
  final String number, label;

  const StatWidget({
    super.key,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Text(
          number,
          style: theme.textTheme.labelLarge,
        ),
        Text(
          label,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
