import 'package:formz/formz.dart';

/// The name of the error.
enum MessageValidationError {
  /// The name of the error.
  invalid
}

/// The model of the email of my ContactMeForm.
class Message extends FormzInput<String, MessageValidationError> {
  /// Constructor which create a pure [FormzInput] with a given value.
  const Message.pure([String value = '']) : super.pure(value);

  /// Constructor which create a dirty [FormzInput] with a given value.
  const Message.dirty([String value = '']) : super.dirty(value);

  @override
  MessageValidationError? validator(String value) {
    return value.length >= 2 ? null : MessageValidationError.invalid;
  }
}
