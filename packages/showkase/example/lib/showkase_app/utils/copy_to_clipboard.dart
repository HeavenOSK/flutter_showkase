import 'package:flutter/services.dart';

void copyToClipboard(String content) {
  if (content?.isNotEmpty ?? false) {
    Clipboard.setData(ClipboardData(text: content));
  }
}
