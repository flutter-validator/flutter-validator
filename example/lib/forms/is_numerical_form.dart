import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class IsNumericalForm extends StatefulWidget {
  const IsNumericalForm({super.key});

  @override
  State<IsNumericalForm> createState() => _IsNumericalFormState();
}

class _IsNumericalFormState extends State<IsNumericalForm> {
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
              validator: const Validator().isNumerical(),
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
