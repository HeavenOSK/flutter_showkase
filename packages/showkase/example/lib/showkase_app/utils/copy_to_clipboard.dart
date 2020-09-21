import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyToClipboard(
  BuildContext context, {
  @required String content,
}) {
  if (content?.isNotEmpty ?? false) {
    Clipboard.setData(ClipboardData(text: content));
    final scaffold = Scaffold.of(context);
    scaffold.hideCurrentSnackBar();
    scaffold.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Text(
              'Copied \'$content\' to clipboard.',
            ),
            Icon(Icons.check),
          ],
        ),
      ),
    );
  }
}
