import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class IsAlphabeticalForm extends StatefulWidget {
  const IsAlphabeticalForm({super.key});

  @override
  State<IsAlphabeticalForm> createState() => _IsAlphabeticalFormState();
}

class _IsAlphabeticalFormState extends State<IsAlphabeticalForm> {
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
              validator: const Validator().isAlphabetical(),
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
