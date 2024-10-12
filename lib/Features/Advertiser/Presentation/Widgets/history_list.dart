import 'package:flutter/material.dart';

import '../../../AdDetails/Presentation/Widgets/ad_card.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Column(
      children: List.filled(4, '')
          .map(
            (e) => AdCard(
              children: [
                Text(
                  'ID :4987',
                  style: theme.labelMedium,
                ),
                Text(
                  'Date :2024-07-16T14:43:30.000000Z',
                  style: theme.labelMedium,
                ),
                Text(
                  'Amount :10',
                  style: theme.labelMedium,
                ),
                Text(
                  'Type :Payment',
                  style: theme.labelMedium,
                ),
                Text(
                  'Payment Method :Credit card',
                  style: theme.labelMedium,
                ),
                Text(
                  'Old Balance :3312.07',
                  style: theme.labelMedium,
                ),
                Text(
                  'New Balance :3312.07',
                  style: theme.labelMedium,
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
