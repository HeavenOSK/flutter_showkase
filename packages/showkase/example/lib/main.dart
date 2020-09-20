import 'package:example/showkase_app/model/model.dart';
import 'package:flutter/material.dart';

import 'showkase_app/app.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowkaseApp(
      lightTheme: lightTheme(),
      darkTheme: darkTheme(),
      components: [
        ShowkaseComponent(
          name: 'RegisterButton',
          group: 'Button',
          component: RaisedButton(
            onPressed: () {},
            child: Text('Register'),
          ),
        ),
        ShowkaseComponent(
          name: 'CanceButton',
          group: 'Button',
          component: RaisedButton(
            onPressed: () {},
            child: Text('Cancel'),
          ),
        ),
        ShowkaseComponent(
          name: 'ConfirmationDialog',
          group: 'Dialog',
          component: AlertDialog(
            content: Text('Are you ok?'),
            actions: [
              RawMaterialButton(
                onPressed: () {},
                child: Text('OK'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
