import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

class AutoLocaleText extends StatelessWidget {
  final String? value;
  final TextAlign? textAlign;
  final TextStyle? style;
  final double? minFontSize;

  const AutoLocaleText(
      {Key? key,
      required this.value,
      this.textAlign,
      this.style,
      this.minFontSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      value!.locale,
      minFontSize: minFontSize ?? 12,
      textAlign: textAlign,
      style: style,
    );
  }
}
