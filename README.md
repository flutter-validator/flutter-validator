# flutter_validator

Validator for form fields in Flutter, supporting distinct messages in each validation step.

## Getting started

flutter_validator is built for simplicity and composition. Pass a Validator to a form field's validator field like this...

```dart
class ExampleForm extends StatefulWidget {
  const ExampleForm({super.key});

  @override
  State<ExampleForm> createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            validator: const Validator().isNotEmpty(message: "Required!"),
          ),
          ElevatedButton(
            onPressed: () => _key.currentState?.validate(),
            child: null,
          ),
        ],
      ),
    );
  }
}
```

...and BAM! You're already making sure that field is not empty.

Though you can use the basic validators as they come, the real magic happens when you use them to build your app's own, more complex, validators:

```dart
import 'package:flutter_validator/flutter_validator.dart';

extension AppValidator on Validator {
  Validator isPassword() {
    return copy()
        .isNotEmpty(
          message: "This field is required!",
        )
        .minLength(
          6,
          message: "The password must be at least 6 characters long!",
        )
        .maxLength(
          20,
          message: "The password must be at most 20 characters long!",
        )
        .matches(
          RegExp(r"^[a-zA-Z0-9]+$"),
          message: "The password can contain only letters and numbers!",
        );
  }
}
```
