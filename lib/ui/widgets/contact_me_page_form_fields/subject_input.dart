import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/contact_me_form_bloc/contact_me_form_bloc.dart';

/// The field where user will enter the subject of the message.
class SubjectInput extends StatelessWidget {
  /// The field where user will enter the subject of the message.
  const SubjectInput({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  /// The [FocusNode] to control if the focus is on this input.
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final contactMeFormBloc = BlocProvider.of<ContactMeFormBloc>(context);
    return BlocBuilder<ContactMeFormBloc, ContactMeFormState>(
      builder: (BuildContext context, ContactMeFormState state) {
        return TextFormField(
          initialValue: state.subject.value,
          keyboardType: TextInputType.text,
          focusNode: focusNode,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Subject',
            hintText: 'Subject',
            prefixIcon: const Icon(Icons.subject_outlined),
            suffixIcon: state.subject.pure
                ? null
                : state.subject.valid
                    ? const Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.error_outline_rounded,
                        color: Colors.red,
                      ),
            errorText: state.subject.invalid
                ? 'Subject must have at least 2 characters.'
                : null,
          ),
          onChanged: (String value) => contactMeFormBloc.add(
            SubjectChanged(
              subject: value,
            ),
          ),
        );
      },
    );
  }
}
