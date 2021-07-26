import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:formz/formz.dart';
import 'package:portfolio/models/contact_me_form_input_models/contact_me_form_input_models.dart';

part 'contact_me_form_event.dart';
part 'contact_me_form_state.dart';

/// The [Bloc] of my `ContactMeForm`.
class ContactMeFormBloc extends Bloc<ContactMeFormEvent, ContactMeFormState> {
  /// The [Bloc] of my `ContactMeForm`.
  ContactMeFormBloc() : super(const ContactMeFormState());

  @override
  void onTransition(
      Transition<ContactMeFormEvent, ContactMeFormState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ContactMeFormState> mapEventToState(ContactMeFormEvent event) async* {
    if (event is EmailChanged) {
      final email = Email.dirty(event.email);
      yield state.copyWith(
        email: email,
        status: Formz.validate(
          [
            email,
            state.message,
            state.name,
            state.subject,
          ],
        ),
      );
    } else if (event is MessageChanged) {
      final message = Message.dirty(event.message);
      yield state.copyWith(
        message: message,
        status: Formz.validate(
          [
            state.email,
            message,
            state.name,
            state.subject,
          ],
        ),
      );
    } else if (event is NameChanged) {
      final name = Name.dirty(event.name);
      yield state.copyWith(
        name: name,
        status: Formz.validate(
          [
            state.email,
            state.message,
            name,
            state.subject,
          ],
        ),
      );
    } else if (event is SubjectChanged) {
      final subject = Subject.dirty(event.subject);
      yield state.copyWith(
        subject: subject,
        status: Formz.validate(
          [
            state.email,
            state.message,
            state.name,
            subject,
          ],
        ),
      );
    } else if (event is EmailUnfocused) {
      final email = Email.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate(
          [
            email,
            state.message,
            state.name,
            state.subject,
          ],
        ),
      );
    } else if (event is MessageUnfocused) {
      final message = Message.dirty(state.message.value);
      yield state.copyWith(
        message: message,
        status: Formz.validate(
          [
            state.email,
            message,
            state.name,
            state.subject,
          ],
        ),
      );
    } else if (event is NameUnfocused) {
      final name = Name.dirty(state.name.value);
      yield state.copyWith(
        name: name,
        status: Formz.validate(
          [
            state.email,
            state.message,
            name,
            state.subject,
          ],
        ),
      );
    } else if (event is SubjectUnfocused) {
      final subject = Subject.dirty(state.subject.value);
      yield state.copyWith(
        subject: subject,
        status: Formz.validate(
          [
            state.email,
            state.message,
            state.name,
            subject,
          ],
        ),
      );
    } else if (event is FormSubmitted) {
      final email = Email.dirty(state.email.value);
      final message = Message.dirty(state.message.value);
      final name = Name.dirty(state.name.value);
      final subject = Subject.dirty(state.subject.value);
      yield state.copyWith(
        email: email,
        message: message,
        name: name,
        subject: subject,
        status: Formz.validate(
          [
            email,
            message,
            name,
            subject,
          ],
        ),
      );
      if (state.status.isValidated) {
        yield state.copyWith(
          status: FormzStatus.submissionInProgress,
        );
        await Future<void>.delayed(
          const Duration(
            seconds: 1,
          ),
        );
        yield state.copyWith(
          status: FormzStatus.submissionSuccess,
        );
      }
    } else if (event is ResetForm) {
      yield const ContactMeFormState();
    }
  }
}
