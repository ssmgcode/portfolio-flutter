import 'package:formz/formz.dart';

/// The name of the error.
enum SubjectValidationError {
  /// The name of the error.
  invalid
}

/// The model of the email of my ContactMeForm.
class Subject extends FormzInput<String, SubjectValidationError> {
  /// Constructor which create a pure [FormzInput] with a given value.
  const Subject.pure([String value = '']) : super.pure(value);

  /// Constructor which create a dirty [FormzInput] with a given value.
  const Subject.dirty([String value = '']) : super.dirty(value);

  @override
  SubjectValidationError? validator(String value) {
    return value.length > 2 ? null : SubjectValidationError.invalid;
  }
}
