import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class MatchesForm extends StatefulWidget {
  const MatchesForm({super.key});

  @override
  State<MatchesForm> createState() => _MatchesFormState();
}

class _MatchesFormState extends State<MatchesForm> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
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
            const Center(
              child: Text(r"^[a-zA-Z0-9]+$"),
            ),
            TextFormField(
              controller: controller1,
              validator: const Validator().matches(RegExp(r"^[a-zA-Z0-9]+$")),
              decoration: const InputDecoration(
                labelText: "THIS SHOULD CONTAIN A MATCH TO THE REGEXP ABOVE",
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
