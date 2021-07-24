import 'package:formz/formz.dart';

/// The name of the error.
enum NameValidationError {
  /// The name of the error.
  invalid
}

/// The model of the email of my ContactMeForm.
class Name extends FormzInput<String, NameValidationError> {
  /// Constructor which create a pure [FormzInput] with a given value.
  const Name.pure([String value = '']) : super.pure(value);

  /// Constructor which create a dirty [FormzInput] with a given value.
  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    return value.length >= 2 ? null : NameValidationError.invalid;
  }
}
