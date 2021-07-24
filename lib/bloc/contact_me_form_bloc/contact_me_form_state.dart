part of 'contact_me_form_bloc.dart';

/// The state for [ContactMeFormBloc].
class ContactMeFormState {
  /// The state for [ContactMeFormBloc].
  const ContactMeFormState({
    this.email = const Email.pure(),
    this.message = const Message.pure(),
    this.name = const Name.pure(),
    this.subject = const Subject.pure(),
    this.status = FormzStatus.pure,
  });

  /// State of [Email].
  final Email email;

  /// State of [Message].
  final Message message;

  /// State of [Name].
  final Name name;

  /// State of [Subject].
  final Subject subject;

  /// The status of the current [ContactMeFormState].
  final FormzStatus status;

  /// Creates a new [ContactMeFormState] with current data and new data.
  ContactMeFormState copyWith({
    Email? email,
    Message? message,
    Name? name,
    Subject? subject,
    FormzStatus? status,
  }) {
    return ContactMeFormState(
      email: email ?? this.email,
      message: message ?? this.message,
      name: name ?? this.name,
      subject: subject ?? this.subject,
      status: status ?? this.status,
    );
  }
}
