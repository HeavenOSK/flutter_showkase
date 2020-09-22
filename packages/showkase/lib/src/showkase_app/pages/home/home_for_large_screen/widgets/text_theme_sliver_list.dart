import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../model/model.dart';
import '../../../../widgets/widgets.dart';

class TextThemeSliverList extends StatelessWidget {
  const TextThemeSliverList({
    @required this.textStyles,
  });

  final List<ShowkaseTextTheme> textStyles;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: PaddingForDesktop.mediumPadding,
        horizontal: PaddingForDesktop.mediumPadding,
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate.fixed(
          textStyles.map((style) {
            return Padding(
              padding: const EdgeInsets.only(
                  bottom: PaddingForDesktop.mediumPadding),
              child: CopierOnTap(
                targetContent: style.copyContent,
                child: Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.all(PaddingForDesktop.mediumPadding),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            style.name,
                            style: style.value,
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'fontSize:${style.value.fontSize.toString()}',
                              ),
                              Text(
                                '${style.value.fontWeight.toString()}',
                              ),
                              Text(
                                '${style.value.color.toString()}',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
