import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import '../../../../Core/Constants/asset_strings.dart';

class MessageTile extends StatelessWidget {
  final String title;
  final String name;
  const MessageTile({super.key, required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Container(
        width: 68,
        height: 68,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.natural400, width: 2),
          shape: BoxShape.circle,
        ),
        child: const CircleAvatar(
          radius: 30,
          backgroundImage:
              AssetImage(ImageStrings.profile), // replace with your image asset
        ),
      ),
      title: Text(
        name,
        style: textTheme.labelLarge,
      ),
      subtitle: Text(
        '3 new message',
        style: textTheme.bodyMedium,
      ),
      trailing: Image.asset(
        IconStrings.camera,
        color: AppColors.natural100,
      ),
    );
  }
}
