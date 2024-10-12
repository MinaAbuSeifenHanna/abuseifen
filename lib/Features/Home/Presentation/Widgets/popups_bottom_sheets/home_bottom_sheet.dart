import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Extentions/center_ext.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';

import '../../../../../Core/Constants/constants.dart';

class HomeBottomSheet extends StatefulWidget {
  final List<Widget> content;
  final int? timeToAutoClose;
  final Widget? stackedWidget;

  const HomeBottomSheet({
    super.key,
    required this.content,
    this.timeToAutoClose,
    this.stackedWidget,
  });

  @override
  State<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Container(
      width: size.size.width,
      padding: EdgeInsets.symmetric(
        horizontal: size.size.width * 0.064,
        vertical: size.size.height * 0.02,
      ),
      margin: EdgeInsets.only(bottom: size.viewInsets.bottom),
      decoration: const BoxDecoration(
        gradient: OtherConstants.appLinearGradient,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.natural600),
                          child: const Icon(Icons.close, color: AppColors.natural100),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.natural100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          height: 4,
                          width: size.size.width * 0.3,
                        ),
                      ).setCenter()
                    ],
                  ),
                  const SizedBox(height: 20),
                  ...widget.content,
                ],
              ).setCenter(),
            ),
            if (widget.stackedWidget != null) widget.stackedWidget!,
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    if (widget.timeToAutoClose != null) {
      Future.delayed(Duration(seconds: widget.timeToAutoClose!), () {
        if (mounted) Navigator.pop(context);
      });
    }
    super.initState();
  }
}

Future showHomeBottomSheet({required BuildContext context, required Widget Function(BuildContext context) builder}) {
  var size = MediaQuery.sizeOf(context);
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    constraints: BoxConstraints(
      minWidth: size.width,
      maxHeight: size.height * 0.9,
    ),
    builder: builder,
  );
}