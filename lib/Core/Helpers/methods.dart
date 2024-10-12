import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Themes/app_colors.dart';

String formatDuration(Duration duration) {
  // Extract minutes and seconds
  int minutes = duration.inMinutes;
  int seconds = duration.inSeconds % 60;

  // Format minutes and seconds as "min:sec"
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}

// Function to copy text to clipboard
void copyToClipboard(BuildContext context, {required String text}) {
  Clipboard.setData(ClipboardData(text: text)).then((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard\n$text'),
        backgroundColor: AppColors.primary500,
      ),
    );
  });
}
