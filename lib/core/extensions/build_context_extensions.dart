import 'package:felicitup/gen/l10n.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  IntlTrans get locale => IntlTrans.of(this);
}
