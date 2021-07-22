import 'package:formz/formz.dart';

/// The name of the error.
enum EmailValidationError {
  /// The name of the error.
  invalid
}

/// The model of the email of my ContactMeForm.
class Email extends FormzInput<String, EmailValidationError> {
  /// Constructor which create a pure [FormzInput] with a given value.
  const Email.pure([String value = '']) : super.pure(value);

  /// Constructor which create a dirty [FormzInput] with a given value.
  const Email.dirty([String value = '']) : super.dirty(value);

  static final _emailRegex = RegExp(
      r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");

  @override
  EmailValidationError? validator(String value) {
    return _emailRegex.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}
