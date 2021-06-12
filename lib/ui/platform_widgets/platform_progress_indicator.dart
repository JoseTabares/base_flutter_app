import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

class PlatformProgressIndicator extends PlatformWidget<
    CupertinoActivityIndicator, CircularProgressIndicator> {
  final Animation<Color> valueColor;
  final double androidStrokeWidth;
  final double iOSRadius;

  PlatformProgressIndicator({
    this.valueColor,
    this.androidStrokeWidth = 4.0,
    this.iOSRadius = 10,
  });

  @override
  CupertinoActivityIndicator createIosWidget(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: iOSRadius,
    );
  }

  @override
  CircularProgressIndicator createAndroidWidget(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: valueColor,
      strokeWidth: androidStrokeWidth,
    );
  }
}
