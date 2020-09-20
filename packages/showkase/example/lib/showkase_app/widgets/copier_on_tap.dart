import 'package:example/showkase_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CopierOnTap extends StatelessWidget {
  const CopierOnTap({
    @required this.targetContent,
    @required this.child,
  });

  final String targetContent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        copyToClipboard(targetContent);

        final scaffold = Scaffold.of(context);
        scaffold.hideCurrentSnackBar();
        scaffold.showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Text(
                  'Copied \'$targetContent\' to clipboard.',
                ),
                Icon(Icons.check),
              ],
            ),
          ),
        );
      },
      child: child,
    );
  }
}
