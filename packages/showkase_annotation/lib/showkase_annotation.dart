library showkase_annotation;

/// A type of [ShowkaseTheme].
enum ShowkaseThemeType {
  light,
  dark,
}

/// An annotation for the `showkase` package.
///
/// Annotating a function with this annotation will flag it to add
/// `showkase` app.
///
/// This annotation expects only function which returns [ThemeData].
class ShowkaseTheme {
  const ShowkaseTheme.light() : type = ShowkaseThemeType.light;
  const ShowkaseTheme.dark() : type = ShowkaseThemeType.dark;

  final ShowkaseThemeType type;
}

/// An annotation for the `showkase` package.
///
/// Annotating a function with this annotation will flag it to add
/// `showkase` app.
///
/// This annotation expects only function which returns [Widget].
class ShowkaseComponent {
  const ShowkaseComponent(this.name);

  final String name;
}
