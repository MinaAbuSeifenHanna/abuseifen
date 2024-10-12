import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Features/Message/Presentation/Widget/message_tile.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GenralAppbar(
              title: 'Message',
              onPressed: () => AppNavigation.pop(),
            ).setHorizontalPadding(context, 0.03),
            SizedBox(height: 20),
            Expanded(
                child: ListView(
              children: [
                ...['Your Story', 'karennne', 'zackjohn', 'kieron_d', 'zackjohn', 'kieron_d', 'craig_love']
                    .map((e) => MessageTile(title: e, name: e))
                    .toList()
              ],
            ))
          ],
        ),
      ),
    );
  }
}
