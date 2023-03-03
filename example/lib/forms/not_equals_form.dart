import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class NotEqualsForm extends StatefulWidget {
  const NotEqualsForm({super.key});

  @override
  State<NotEqualsForm> createState() => _NotEqualsFormState();
}

class _NotEqualsFormState extends State<NotEqualsForm> {
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
              validator: const Validator().notEquals(controller2),
              decoration: const InputDecoration(
                labelText: "STRING 1",
              ),
            ),
            TextFormField(
              controller: controller2,
              validator: const Validator().notEquals(controller1),
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
