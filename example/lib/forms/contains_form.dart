import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class ContainsForm extends StatefulWidget {
  const ContainsForm({super.key});

  @override
  State<ContainsForm> createState() => _ContainsFormState();
}

class _ContainsFormState extends State<ContainsForm> {
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
            const Center(
              child: Text("ASDF"),
            ),
            TextFormField(
              controller: controller,
              validator: const Validator().contains("ASDF"),
              decoration: const InputDecoration(
                labelText: "THIS SHOULD CONTAIN THE STRING ABOVE",
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
