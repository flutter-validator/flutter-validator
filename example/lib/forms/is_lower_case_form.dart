import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class IsLowerCaseForm extends StatefulWidget {
  const IsLowerCaseForm({super.key});

  @override
  State<IsLowerCaseForm> createState() => _IsLowerCaseFormState();
}

class _IsLowerCaseFormState extends State<IsLowerCaseForm> {
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
              validator: const Validator().isLowerCase(),
              decoration: const InputDecoration(
                labelText: "ALL LETTERS HERE SHOULD BE LOWERCASE",
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
