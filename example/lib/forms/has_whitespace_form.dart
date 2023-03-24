import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class HasWhitespaceForm extends StatefulWidget {
  const HasWhitespaceForm({super.key});

  @override
  State<HasWhitespaceForm> createState() => _HasWhitespaceFormState();
}

class _HasWhitespaceFormState extends State<HasWhitespaceForm> {
  final controller = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: controller,
              validator: const Validator().hasWhitespace(),
              decoration: const InputDecoration(
                labelText: "THIS SHOULD CONTAIN AT LEAST ONE WHITESPACE",
              ),
            ),
            ElevatedButton(
              onPressed: () => key.currentState!.validate(),
              child: const Text("SUBMIT"),
            )
          ],
        ),
      ),
    );
  }
}
