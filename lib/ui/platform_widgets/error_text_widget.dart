import 'package:flutter/material.dart';

class ErrorTextWidget extends StatefulWidget {
  final String? text;

  ErrorTextWidget({
    this.text,
  });

  @override
  _ErrorTextWidgetState createState() => _ErrorTextWidgetState();
}

class _ErrorTextWidgetState extends State<ErrorTextWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      vsync: this,
      duration: Duration(milliseconds: 300),
      child: widget.text == null
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                widget.text!,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .apply(color: Theme.of(context).errorColor),
                maxLines: 3,
              ),
            ),
    );
  }
}
