part of 'contact_me_form_bloc.dart';

@immutable

/// The super class of the events of my bloc.
abstract class ContactMeFormEvent {
  /// The super class of the events of my bloc.
  const ContactMeFormEvent();
}

// <- EMAIL

/// The event to execute when [Email] changes.
class EmailChanged extends ContactMeFormEvent {
  /// The event to execute when [Email] changes.
  const EmailChanged({required this.email});

  /// The new email to storage.
  final String email;
}

/// The event to execute when [Email] text field is unfocused.
class EmailUnfocused extends ContactMeFormEvent {}

// ->

// <- MESSAGE

/// The event to execute when [Message] changes.
class MessageChanged extends ContactMeFormEvent {
  /// The event to execute when [Message] changes.
  const MessageChanged({required this.message});

  /// The new message to storage.
  final String message;
}

/// The event to execute when [Message] text field is unfocused.
class MessageUnfocused extends ContactMeFormEvent {}

// ->

// <- NAME

/// The event to execute when [Name] changes.
class NameChanged extends ContactMeFormEvent {
  /// The event to execute when [Name] changes.
  const NameChanged({required this.name});

  /// The new name to storage.
  final String name;
}

/// The event to execute when [Name] text field is unfocused.
class NameUnfocused extends ContactMeFormEvent {}

// ->

// <- SUBJECT

/// The event to execute when [Subject] changes.
class SubjectChanged extends ContactMeFormEvent {
  /// The event to execute when [Subject] changes.
  const SubjectChanged({required this.subject});

  /// The new subject to storage;
  final String subject;
}

/// The event to execute when [Subject] text field is unfocused.
class SubjectUnfocused extends ContactMeFormEvent {}

/// The event to execute when the form is submitted.
class FormSubmitted extends ContactMeFormEvent {}

/// The event to reset the form.
class ResetForm extends ContactMeFormEvent {}
