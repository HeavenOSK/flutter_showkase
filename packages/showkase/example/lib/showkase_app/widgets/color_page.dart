// import 'dart:collection';
//
// import 'package:example/showkase_app/model/showkase_color.dart';
// import 'package:flutter/material.dart';
//
// extension _DisplayColors on ThemeData {
//   List<ShowkaseColor> get displayColors => [
//         ShowkaseColor('primaryColor', this.primaryColor),
//         ShowkaseColor('primaryColorLight', this.primaryColorLight),
//         ShowkaseColor('primaryColorDark', this.primaryColorDark),
//         ShowkaseColor('canvasColor', this.canvasColor),
//         ShowkaseColor('accentColor', this.accentColor),
//         ShowkaseColor('scaffoldBackgroundColor', this.scaffoldBackgroundColor),
//         ShowkaseColor('bottomAppBarColor', this.bottomAppBarColor),
//         ShowkaseColor('cardColor', this.cardColor),
//         ShowkaseColor('dividerColor', this.dividerColor),
//         ShowkaseColor('focusColor', this.focusColor),
//         ShowkaseColor('hoverColor', this.hoverColor),
//         ShowkaseColor('highlightColor', this.highlightColor),
//         ShowkaseColor('splashColor', this.splashColor),
//         ShowkaseColor('selectedRowColor', this.selectedRowColor),
//         ShowkaseColor('unselectedWidgetColor', this.unselectedWidgetColor),
//         ShowkaseColor('disabledColor', this.disabledColor),
//         ShowkaseColor('buttonColor', this.buttonColor),
//         ShowkaseColor('secondaryHeaderColor', this.secondaryHeaderColor),
//         ShowkaseColor('textSelectionColor', this.textSelectionColor),
//         ShowkaseColor('cursorColor', this.cursorColor),
//         ShowkaseColor(
//             'textSelectionHandleColor', this.textSelectionHandleColor),
//         ShowkaseColor('backgroundColor', this.backgroundColor),
//         ShowkaseColor('dialogBackgroundColor', this.dialogBackgroundColor),
//         ShowkaseColor('indicatorColor', this.indicatorColor),
//         ShowkaseColor('hintColor', this.hintColor),
//         ShowkaseColor('errorColor', this.errorColor),
//         ShowkaseColor('toggleableActiveColor', this.toggleableActiveColor),
//       ];
// }
//
// class ColorPage extends StatelessWidget {
//   const ColorPage();
//
//   @override
//   Widget build(BuildContext context) {
//     final themeData = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$ColorPage'),
//       ),
//       body: ListView(
//         children: [
//           for (final entry in themeData.displayColors.entries)
//             _ColorListItem(
//               name: entry.key,
//               color: entry.value,
//             ),
//         ],
//       ),
//     );
//   }
// }
//
// class _ColorListItem extends StatelessWidget {
//   const _ColorListItem({
//     @required this.name,
//     @required this.color,
//     Key key,
//   }) : super(key: key);
//
//   final String name;
//   final Color color;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(name),
//       trailing: LayoutBuilder(
//         builder: (context, constraints) {
//           return Container(
//             decoration: BoxDecoration(
//               color: color,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   spreadRadius: 4,
//                   blurRadius: 5,
//                 ),
//               ],
//             ),
//             height: constraints.maxHeight,
//             width: constraints.maxHeight,
//           );
//         },
//       ),
//     );
//   }
// }
