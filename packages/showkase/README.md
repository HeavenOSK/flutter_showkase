# showkase
## Usage
Add a variable for your component.
```dart
final showkasedTheme = ShowkasedTheme(
  theme: lightTheme(),
  darkTheme: darkTheme(),
);

final incrementButton = ShowkasedComponent(
  name: '$IncrementButton',
  groupName: 'Button',
  component: IncrementButton(
    onTap: () {},
  ),
);

```