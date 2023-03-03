import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class EqualsForm extends StatefulWidget {
  const EqualsForm({super.key});

  @override
  State<EqualsForm> createState() => _EqualsFormState();
}

class _EqualsFormState extends State<EqualsForm> {
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
            TextFormField(
              controller: controller1,
              validator: const Validator().equals(controller2),
              decoration: const InputDecoration(
                labelText: "STRING 1",
              ),
            ),
            TextFormField(
              controller: controller2,
              validator: const Validator().equals(controller1),
              decoration: const InputDecoration(
                labelText: "STRING 2",
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
