import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/contact_me_form_bloc/contact_me_form_bloc.dart';
import 'package:formz/formz.dart';

/// Creates the submit button for `ContactMeForm`
class ContactMeFormSubmitButton extends StatelessWidget {
  /// Creates the submit button for `ContactMeForm`
  const ContactMeFormSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactMeFormBloc = BlocProvider.of<ContactMeFormBloc>(context);
    return BlocBuilder<ContactMeFormBloc, ContactMeFormState>(
      buildWhen: (
        ContactMeFormState previousState,
        ContactMeFormState currentState,
      ) =>
          previousState.status != currentState.status,
      builder: (BuildContext context, ContactMeFormState state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed:
                state.status.isValidated && !state.status.isSubmissionInProgress
                    ? () => contactMeFormBloc.add(FormSubmitted())
                    : null,
            icon: state.status.isSubmissionInProgress
                ? SizedBox(
                    height: 17,
                    width: 17,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).disabledColor,
                      strokeWidth: 2.5,
                    ),
                  )
                : const Icon(Icons.send_outlined),
            label: const Text('Contact Me'),
          ),
        );
      },
    );
  }
}
