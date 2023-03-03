import 'package:flutter/material.dart';
import 'package:flutter_validator/flutter_validator.dart';

class MinLengthForm extends StatefulWidget {
  const MinLengthForm({super.key});

  @override
  State<MinLengthForm> createState() => _MinLengthFormState();
}

class _MinLengthFormState extends State<MinLengthForm> {
  final controller = TextEditingController();
  final key = GlobalKey<FormState>();
  double _value = 0;
  double get value => _value;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Slider(
              min: 0,
              max: 5,
              value: _value,
              divisions: 5,
              label: value.floor().toString(),
              onChanged: (double value) => setState(() => _value = value),
            ),
            TextFormField(
              controller: controller,
              validator: const Validator().minLength(value.floor()),
              decoration: InputDecoration(
                labelText:
                    "THIS SHOULD HAVE AT LEAST ${value.floor()} CHARACTERS",
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
