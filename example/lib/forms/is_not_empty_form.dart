import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class IsNotEmptyForm extends StatefulWidget {
  const IsNotEmptyForm({super.key});

  @override
  State<IsNotEmptyForm> createState() => _IsNotEmptyFormState();
}

class _IsNotEmptyFormState extends State<IsNotEmptyForm> {
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
              validator: const Validator().isNotEmpty(),
              decoration: const InputDecoration(
                labelText: "THIS SHOULD NOT BE EMPTY",
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
