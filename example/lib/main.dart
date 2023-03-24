import 'package:flutter/material.dart';

import 'forms/contains_form.dart';
import 'forms/equals_form.dart';
import 'forms/has_no_whitespace_form.dart';
import 'forms/has_whitespace_form.dart';
import 'forms/is_alphabetical_form.dart';
import 'forms/is_alphanumerical_form.dart';
import 'forms/is_lower_case_form.dart';
import 'forms/is_not_empty_form.dart';
import 'forms/is_numerical_form.dart';
import 'forms/is_upper_case_form.dart';
import 'forms/matches_form.dart';
import 'forms/max_length_form.dart';
import 'forms/min_length_form.dart';
import 'forms/not_equals_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final color1 = const Color(0xFFF0F0F0);
  final color2 = const Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            ExpansionTile(
              title: const Text("Validator.equals()"),
              subtitle: const Text(
                "For when you want to make sure two values match.",
              ),
              backgroundColor: color1,
              collapsedBackgroundColor: color1,
              children: const [EqualsForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.notEquals()"),
              subtitle: const Text(
                "For when you want to make sure two values do not match.",
              ),
              backgroundColor: color2,
              collapsedBackgroundColor: color2,
              children: const [NotEqualsForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.contains()"),
              subtitle: const Text(
                "For when you want to make sure a value contains a substring.",
              ),
              backgroundColor: color1,
              collapsedBackgroundColor: color1,
              children: const [ContainsForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.matches()"),
              subtitle: const Text(
                "For when you want to make sure a value has a match to a RegExp.",
              ),
              backgroundColor: color2,
              collapsedBackgroundColor: color2,
              children: const [MatchesForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.isNotEmpty()"),
              subtitle: const Text(
                "For when you want to make sure a value is not an empty string.",
              ),
              backgroundColor: color1,
              collapsedBackgroundColor: color1,
              children: const [IsNotEmptyForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.hasWhitespace()"),
              subtitle: const Text(
                "For when you want to make sure a value has no whitespaces, as defined in https://en.wikipedia.org/wiki/Whitespace_character",
              ),
              backgroundColor: color2,
              collapsedBackgroundColor: color2,
              children: const [HasWhitespaceForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.hasNoWhitespace()"),
              subtitle: const Text(
                "For when you want to make sure a value has no whitespaces, as defined in https://en.wikipedia.org/wiki/Whitespace_character",
              ),
              backgroundColor: color1,
              collapsedBackgroundColor: color1,
              children: const [HasNoWhitespaceForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.minLength(...)"),
              subtitle: const Text(
                "For when you want to make sure a value has at least N characters.",
              ),
              backgroundColor: color2,
              collapsedBackgroundColor: color2,
              children: const [MinLengthForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.maxLength(...)"),
              subtitle: const Text(
                "For when you want to make sure a value has at most N characters.",
              ),
              backgroundColor: color1,
              collapsedBackgroundColor: color1,
              children: const [MaxLengthForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.isUpperCase(...)"),
              subtitle: const Text(
                "For when you want to make sure a value has at most N characters.",
              ),
              backgroundColor: color2,
              collapsedBackgroundColor: color2,
              children: const [IsUpperCaseForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.isLowerCase(...)"),
              subtitle: const Text(
                "For when you want to make sure a value has at most N characters.",
              ),
              backgroundColor: color1,
              collapsedBackgroundColor: color1,
              children: const [IsLowerCaseForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.isNumerical(...)"),
              subtitle: const Text(
                "For when you want to make sure a value contains only numbers.",
              ),
              backgroundColor: color2,
              collapsedBackgroundColor: color2,
              children: const [IsNumericalForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.isAlphabetical(...)"),
              subtitle: const Text(
                "For when you want to make sure a value contains only letters.",
              ),
              backgroundColor: color1,
              collapsedBackgroundColor: color1,
              children: const [IsAlphabeticalForm()],
            ),
            ExpansionTile(
              title: const Text("Validator.isAlphanumerical(...)"),
              subtitle: const Text(
                "For when you want to make sure a value contains only numbers or letters.",
              ),
              backgroundColor: color2,
              collapsedBackgroundColor: color2,
              children: const [IsAlphanumericalForm()],
            ),
          ],
        ),
      ),
    );
  }
}
