import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class IsAlphanumericalForm extends StatefulWidget {
  const IsAlphanumericalForm({super.key});

  @override
  State<IsAlphanumericalForm> createState() => _IsAlphanumericalFormState();
}

class _IsAlphanumericalFormState extends State<IsAlphanumericalForm> {
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
              validator: const Validator().isAlphanumerical(),
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
