import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

//If enableMediaQuery is true, the padding value is calculated as a proportion of the screen width using MediaQuery.size.width. Otherwise, the raw value is used.
extension PaddingtoWidget on Widget {
  //Adds horizontal padding to a widget.
  Widget setHorizontalPadding(BuildContext context, double value, {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: enableMediaQuery ? mediaQuery.size.width * value : value,
      ),
      child: this,
    );
  }

  //Similar to setHorizontalPadding, but adds vertical padding instead
  Widget setVerticalPadding(BuildContext context, double value, {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: enableMediaQuery ? mediaQuery.size.width * value : value,
      ),
      child: this,
    );
  }

  //Adds both horizontal and vertical padding to a widget.
  Widget setHorizontalAndVerticalPadding(BuildContext context, double widthValue, double heightValue,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: enableMediaQuery ? mediaQuery.size.width * widthValue : widthValue,
        vertical: enableMediaQuery ? mediaQuery.size.height * heightValue : heightValue,
      ),
      child: this,
    );
  }

  //Allows setting padding for each side (top, bottom, right, left) individually.
  Widget setOnlyPadding(BuildContext context, double top, double down, double right, double left,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: enableMediaQuery ? mediaQuery.size.height * top : top,
        bottom: enableMediaQuery ? mediaQuery.size.height * down : down,
        right: context.locale.toString() == 'ar'
            ? enableMediaQuery
                ? mediaQuery.size.width * left
                : left
            : enableMediaQuery
                ? mediaQuery.size.width * right
                : right,
        left: context.locale.toString() == 'ar'
            ? enableMediaQuery
                ? mediaQuery.size.width * right
                : right
            : enableMediaQuery
                ? mediaQuery.size.width * left
                : left,
      ),
      child: this,
    );
  }
}
