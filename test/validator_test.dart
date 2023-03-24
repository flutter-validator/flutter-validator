import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validator/flutter_validator.dart';

/// For each item in [accepts] runs the following:
/// ```dart
/// test("Accept ${description(item)}", () {
///   expect(
///     validator.call(item),
///     equals(null),
///   );
/// });
/// ```
///
/// For each item in [rejects] runs the following:
/// ```dart
/// test("Reject ${description(item)}", () {
///   expect(
///     validator.call(item),
///     isNot(equals(null)),
///   );
/// });
/// ```
void batchTest({
  required String Function(String? value) description,
  required Validator validator,
  List<String?> accept = const [],
  List<String?> reject = const [],
}) {
  for (var item in accept) {
    test("Accept ${description(item)}", () {
      expect(
        validator.call(item),
        equals(null),
      );
    });
  }

  for (var item in reject) {
    test("Reject ${description(item)}", () {
      expect(
        validator.call(item),
        isNot(equals(null)),
      );
    });
  }
}

/// For each item in [accepts] runs the following:
/// ```dart
/// expect(
///   validator.call(item),
///   equals(null),
/// );
/// ```
///
/// For each item in [rejects] runs the following:
/// ```dart
/// expect(
///   validator.call(item),
///   isNot(equals(null)),
/// );
/// ```
void batchExpect({
  required Validator validator,
  List<String?> accept = const [],
  List<String?> reject = const [],
}) {
  for (var item in accept) {
    expect(
      validator.call(item),
      equals(null),
    );
  }

  for (var item in reject) {
    expect(
      validator.call(item),
      isNot(equals(null)),
    );
  }
}

void main() {
  // group("Validator().copy()", () {});

  // group("Validator().add()", () {});

  test("Validator().equals(...)", () {
    var controller = TextEditingController();
    var validator = const Validator().equals(controller);

    batchExpect(
      validator: validator,
      accept: [""],
      reject: [null],
    );

    controller.text = "foo";

    batchExpect(
      validator: validator,
      accept: ["foo"],
      reject: [null, ""],
    );
  });

  test("Validator().notEquals(...)", () {
    var controller = TextEditingController();
    var validator = const Validator().notEquals(controller);

    batchExpect(
      validator: validator,
      accept: [null, "foo"],
      reject: [""],
    );

    controller.text = "foo";

    batchExpect(
      validator: validator,
      accept: [null, ""],
      reject: ["foo"],
    );
  });

  test("Validator().contains(...)", () {
    var validator = const Validator().contains("foo");

    batchExpect(
      validator: validator,
      accept: ["foo", " foo", "foo ", " foo "],
      reject: [null, "fo o", "fo\no"],
    );
  });

  test("Validator().matches(...)", () {
    var validator = const Validator().matches(RegExp(r"^[a-zA-Z0-9]+$"));

    batchExpect(
      validator: validator,
      accept: ["a", "A", "0", "aA0"],
      reject: [null, "", "ç"],
    );
  });

  test("Validator().isNotEmpty()", () {
    var validator = const Validator().isNotEmpty();

    batchExpect(
      validator: validator,
      accept: ["foo"],
      reject: [null, "", " ", "\n", "\t", "\r"],
    );
  });

  test("Validator().hasWhitespace()", () {
    var validator = const Validator().hasWhitespace();

    batchExpect(
      validator: validator,
      accept: [
        " ",
        "\n",
        "\t",
        "\r",
        "\u0009",
        "\u000A",
        "\u000B",
        "\u000C",
        "\u000D",
        "\u0020",
        "\u0085",
        "\u00A0",
        "\u1680",
        "\u2000",
        "\u2001",
        "\u2002",
        "\u2003",
        "\u2004",
        "\u2005",
        "\u2006",
        "\u2007",
        "\u2008",
        "\u2009",
        "\u200A",
        "\u2028",
        "\u2029",
        "\u202F",
        "\u205F",
        "\u3000"
      ],
      reject: ["foo"],
    );
  });

  test("Validator().hasNoWhitespace()", () {
    var validator = const Validator().hasNoWhitespace();

    batchExpect(
      validator: validator,
      accept: ["foo"],
      reject: [
        " ",
        "\n",
        "\t",
        "\r",
        "\u0009",
        "\u000A",
        "\u000B",
        "\u000C",
        "\u000D",
        "\u0020",
        "\u0085",
        "\u00A0",
        "\u1680",
        "\u2000",
        "\u2001",
        "\u2002",
        "\u2003",
        "\u2004",
        "\u2005",
        "\u2006",
        "\u2007",
        "\u2008",
        "\u2009",
        "\u200A",
        "\u2028",
        "\u2029",
        "\u202F",
        "\u205F",
        "\u3000"
      ],
    );
  });

  group("Validator().minLength(...)", () {
    batchTest(
      description: (value) => "length: 0, trim: false, value: '$value'",
      validator: const Validator().minLength(0),
      accept: [null, "", " ", "f", "fo", "foo", " fo "],
      reject: [],
    );

    batchTest(
      description: (value) => "length: 1, trim: false, value: '$value'",
      validator: const Validator().minLength(1),
      accept: [" ", "f", "fo", "foo", " fo "],
      reject: [null, ""],
    );

    batchTest(
      description: (value) => "length: 2, trim: false, value: '$value'",
      validator: const Validator().minLength(2),
      accept: ["fo", "foo", " fo "],
      reject: [null, "", " ", "f"],
    );

    batchTest(
      description: (value) => "length: 2, trim: true, value: '$value'",
      validator: const Validator().minLength(3, trim: true),
      accept: ["foo"],
      reject: [null, "", " ", "f", "fo", "  fo  "],
    );
  });

  group("Validator().maxLength(...)", () {
    batchTest(
      description: (value) => "length: 0, trim: false, value: '$value'",
      validator: const Validator().maxLength(0),
      accept: [null, ""],
      reject: [" ", "f", "fo", "foo", "  fo  "],
    );

    batchTest(
      description: (value) => "length: 1, trim: false, value: '$value'",
      validator: const Validator().maxLength(1),
      accept: [null, "", " ", "f"],
      reject: ["fo", "foo", "  fo  "],
    );

    batchTest(
      description: (value) => "length: 2, trim: false, value: '$value'",
      validator: const Validator().maxLength(2),
      accept: [null, "", " ", "f", "fo"],
      reject: ["foo", "  fo  "],
    );

    batchTest(
      description: (value) => "length: 2, trim: true, value: '$value'",
      validator: const Validator().maxLength(2, trim: true),
      accept: [null, "", " ", "f", "fo", "  fo  "],
      reject: ["foo"],
    );
  });

  group("Validator().isUpperCase()", () {
    batchTest(
      description: (value) => "'$value'",
      validator: const Validator().isUpperCase(),
      accept: [null, "", " ", "A", "Ç", "0", "!"],
      reject: ["a", "á", "ç", "aA", "0a"],
    );
  });

  group("Validator().isLowerCase()", () {
    batchTest(
      description: (value) => "'$value'",
      validator: const Validator().isLowerCase(),
      accept: [null, "", " ", "a", "ç", "0", "!"],
      reject: ["A", "Á", "Ç", "aA", "0A"],
    );
  });

  group("Validator().isNumerical()", () {
    batchTest(
      description: (value) => "'$value'",
      validator: const Validator().isNumerical(),
      accept: [null, "", " ", "0", "0 1", "1234567890"],
      reject: ["0xFFFFFF", "a", "A", "#"],
    );
  });

  group("Validator().isAlphabetical()", () {
    batchTest(
      description: (value) => "'$value'",
      validator: const Validator().isAlphabetical(),
      accept: [
        null,
        "",
        " ",
        "abcdefghijklmnopqrstuvwxyz",
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        "ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ",
        "ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö",
        "øùúûüýþÿ",
      ],
      reject: [r"1234567890'!@#$%¨&*()-_=+§´`[]{}^~ºª<>,.;:/?°"],
    );
  });

  group("Validator().isAlphanumerical()", () {
    batchTest(
      description: (value) => "'$value'",
      validator: const Validator().isAlphanumerical(),
      accept: [
        null,
        "",
        " ",
        "0",
        "0 1",
        "1234567890",
        "abcdefghijklmnopqrstuvwxyz",
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        "ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ",
        "ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö",
        "øùúûüýþÿ",
      ],
      reject: [r"'!@#$%¨&*()-_=+§´`[]{}^~ºª<>,.;:/?°"],
    );
  });
}
