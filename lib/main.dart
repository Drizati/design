import 'package:design/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() => runApp(DesignUI());

class DesignUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Storybook(
        children: [
          Story.simple(
            name: 'Text Field',
            child: DUITextField(
              color: Colors.indigo,
              icon: Icons.lock,
              placeholder: "Password",
              validator: (value, error, success, message) {
                if (value != null && value.length < 6)
                  return "password too short";
              },
            ),
          ),
          Story(
            name: 'Raised button',
            builder: (_, k) => RaisedButton(
              onPressed:
                  k.boolean(label: 'Enabled', initial: true) ? () {} : null,
              color: k.options(
                label: 'Color',
                initial: Colors.deepOrange,
                options: const [
                  Option('Red', Colors.deepOrange),
                  Option('Green', Colors.teal),
                ],
              ),
              textColor: Colors.white,
              child: Text(k.text(label: 'Text', initial: 'Raised button')),
            ),
          ),
        ],
      );
}
