import 'package:example/paddings.dart';
import 'package:example/showkase_app/model/showkase_group.dart';
import 'package:example/showkase_app/model/showkase_text_style.dart';
import 'package:example/showkase_app/widgets/copier_on_tap.dart';
import 'package:flutter/material.dart';

class TextThemeSliverList extends StatelessWidget {
  const TextThemeSliverList({
    @required this.textStyles,
  });

  final List<ShowkaseTextTheme> textStyles;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: mediumPadding,
        horizontal: mediumPadding,
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate.fixed(
          textStyles.map((style) {
            return CopierOnTap(
              targetContent: style.copyContent,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    style.name,
                    style: style.value,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
