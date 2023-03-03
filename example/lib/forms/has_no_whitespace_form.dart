import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class HasNoWhitespaceForm extends StatefulWidget {
  const HasNoWhitespaceForm({super.key});

  @override
  State<HasNoWhitespaceForm> createState() => _HasNoWhitespaceFormState();
}

class _HasNoWhitespaceFormState extends State<HasNoWhitespaceForm> {
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
              validator: const Validator().hasNoWhitespace(),
              decoration: const InputDecoration(
                labelText: "THIS SHOULD NOT CONTAIN ANY WHITESPACE",
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
