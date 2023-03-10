import 'package:flutter/material.dart';

import './app_text.dart';

class AppRichText extends StatelessWidget {
  const AppRichText(
      {super.key, this.style, required this.children, this.selectable = true});

  final TextStyle? style;
  final List<AppText> children;
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    Widget result = Text.rich(TextSpan(
        style: style,
        children: children
            .map((text) =>
                TextSpan(text: text.text, style: style?.merge(text.textStyle)))
            .toList()));

    return selectable ? SelectionArea(child: result) : result;
  }
}
