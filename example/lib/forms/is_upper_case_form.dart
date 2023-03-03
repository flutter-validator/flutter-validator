import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class IsUpperCaseForm extends StatefulWidget {
  const IsUpperCaseForm({super.key});

  @override
  State<IsUpperCaseForm> createState() => _IsUpperCaseFormState();
}

class _IsUpperCaseFormState extends State<IsUpperCaseForm> {
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
              validator: const Validator().isUpperCase(),
              decoration: const InputDecoration(
                labelText: "ALL LETTERS HERE SHOULD BE UPPERCASE",
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
