import 'package:base_flutter_app/ui/platform_widgets/platform_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

class PlatformButton extends PlatformWidget<CupertinoButton, ElevatedButton> {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final bool isLoading;

  PlatformButton({
    @required this.onPressed,
    this.text,
    this.color,
    this.isLoading = false,
  });

  @override
  ElevatedButton createAndroidWidget(BuildContext context) {
    return ElevatedButton(
      child: isLoading
          ? SizedBox(
              height: 18.0,
              width: 18.0,
              child: PlatformProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                androidStrokeWidth: 2,
              ),
            )
          : Text(text),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        primary: color,
      ),
    );
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    return CupertinoButton(
      child: isLoading ? PlatformProgressIndicator() : Text(text),
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      color: color ?? Theme.of(context).cupertinoOverrideTheme?.primaryColor,
    );
  }
}
