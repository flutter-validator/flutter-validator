import 'package:flutter/material.dart';

class Validator {
  const Validator({
    this.callbacks = const [],
  });

  final List<String? Function(String?)> callbacks;

  /// Returns a copy of this Validator.
  Validator copy() {
    return Validator(callbacks: callbacks.toList());
  }

  /// Returns a copy of this Validator, with [callback] added to the end of its [callbacks].
  Validator add(
    String? Function(String?) callback,
  ) {
    return Validator(
      callbacks: callbacks.toList()..add(callback),
    );
  }

  /// Returns a Validator that accepts a value that is equal to the [controller]'s text.
  Validator equals(
    TextEditingController controller, {
    String message = "Validator.equals",
  }) {
    return add(
      (value) => value != controller.text ? message : null,
    );
  }

  /// Returns a Validator that accepts a value that is not equal to the [controller]'s text.
  Validator notEquals(
    TextEditingController controller, {
    String message = "Validator.notEquals",
  }) {
    return add(
      (value) => value == controller.text ? message : null,
    );
  }

  /// Returns a Validator that accepts a value that contains a match of [string].
  ///
  /// Always rejects null;
  Validator contains(
    String string, {
    String message = "Validator.contains",
  }) {
    return add(
      (value) => value == null || !value.contains(string) ? message : null,
    );
  }

  /// Returns a Validator that accepts a value that has a match in [regExp].
  ///
  /// If the value is null, it is treated as an empty [String].
  Validator matches(
    RegExp regExp, {
    String message = "Validator.matches",
  }) {
    return add(
      (value) => regExp.hasMatch(value ?? "") ? null : message,
    );
  }

  /// Returns a Validator that accepts a value that is not null or empty.
  ///
  /// accepts:
  /// ```dart
  /// "foo"
  /// ```
  ///
  /// rejects:
  /// ```
  /// null, "", " ",
  /// ```
  Validator isNotEmpty({
    String message = "Validator.isNotEmpty",
  }) {
    return add(
      (value) => value == null || value.trim().isEmpty ? message : null,
    );
  }

  /// Returns a Validator that accepts a value that contains no whitespace
  /// characters.
  ///
  /// Whitespace characters are as defined in:
  /// https://en.wikipedia.org/wiki/Whitespace_character
  Validator hasNoWhitespace({
    String message = "Validator.hasNoWhitespace",
  }) {
    var regExp = RegExp(
      r"[\u0009-\u000D\u0020\u0085\u00A0\u1680\u2000-\u200A\u2028\u2029\u202F\u205F\u3000]",
      unicode: true,
    );

    return add(
      (value) => regExp.hasMatch(value ?? "") ? message : null,
    );
  }

  /// Returns a Validator that accepts a value that is longer or of equal length to [length].
  ///
  /// If the value is null, its length is treated as zero.
  ///
  /// If [trim] is `true` leading and trailing spaces will be ignored.
  Validator minLength(
    int length, {
    bool trim = false,
    String message = "Validator.minLength",
  }) {
    return add(
      (value) {
        var v = trim ? (value ?? "").trim() : (value ?? "");
        return v.length < length ? message : null;
      },
    );
  }

  /// Returns a Validator that accepts a value that is shorter or of equal length to [length].
  ///
  /// If the value is null, its length is treated as zero.
  ///
  /// If [trim] is `true` leading and trailing spaces will be ignored.
  Validator maxLength(
    int length, {
    bool trim = false,
    String message = "Validator.maxLength",
  }) {
    return add(
      (value) {
        var v = trim ? (value ?? "").trim() : (value ?? "");
        return v.length > length ? message : null;
      },
    );
  }

  /// Returns a Validator that accepts a value where all letters are upper-case.
  ///
  /// TODO: Check whether there is a better way to validate this.
  Validator isUpperCase({
    String message = "Validator.isUpperCase",
  }) {
    return add(
      (value) => value == value?.toUpperCase() ? null : message,
    );
  }

  /// Returns a Validator that accepts a value where all letters are lower-case.
  ///
  /// TODO: Check whether there is a better way to validate this.
  Validator isLowerCase({
    String message = "Validator.isLowerCase",
  }) {
    return add(
      (value) => value == value?.toLowerCase() ? null : message,
    );
  }

  /// Returns a Validator that accepts a value that is comprised of only numbers, or empty.
  ///
  /// accepts
  /// ```dart
  /// null, "", " ", "0", " 0", "0 ", "0 1"
  /// ```
  ///
  /// rejects
  /// ```dart
  /// "0xFFFFFF"
  /// ```
  Validator isNumerical({
    String message = "Validator.isNumerical",
  }) {
    var source = r"^([0-9]* *)*$";
    return copy().matches(RegExp(source), message: message);
  }

  /// Returns a Validator that accepts a value that is comprised of only letters, or empty.
  ///
  /// https://stackoverflow.com/questions/20690499/concrete-javascript-regular-expression-for-accented-characters-diacritics
  /// https://unicode-table.com/en/
  /// accepts
  /// ```dart
  /// null, "", " ", "foo", " foo", "foo ", "foo bar", " foo bar "
  /// ```
  ///
  /// rejects
  /// ```dart
  /// "0", "X Æ A-12",
  /// ```
  Validator isAlphabetical({
    String message = "Validator.isAlphabetical",
  }) {
    var source = r"^([A-Za-zÀ-ÖØ-öø-ÿ]* *)*$";
    return copy().matches(RegExp(source, unicode: true), message: message);
  }

  /// Returns a Validator that accepts a value that is comprised of only letters and numbers, or empty.
  ///
  /// https://stackoverflow.com/questions/20690499/concrete-javascript-regular-expression-for-accented-characters-diacritics
  /// https://unicode-table.com/en/
  Validator isAlphanumerical({
    String message = "Validator.isAlphanumerical",
  }) {
    var source = r"^([A-Za-zÀ-ÖØ-öø-ÿ0-9]* *)*$";
    return copy().matches(RegExp(source), message: message);
  }

  String? call(String? value) {
    String? message;
    for (var callback in callbacks) {
      message = callback(value);
      if (message != null) break;
    }
    return message;
  }
}
