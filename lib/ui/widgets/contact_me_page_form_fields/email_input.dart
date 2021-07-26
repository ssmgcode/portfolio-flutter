import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/contact_me_form_bloc/contact_me_form_bloc.dart';

/// The field where user will enter their email.
class EmailInput extends StatelessWidget {
  /// The field where user will enter their email.
  const EmailInput({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  /// The [FocusNode] to control if the focus is on this input.
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final contactMeFormBloc = BlocProvider.of<ContactMeFormBloc>(context);
    final controller = TextEditingController(
      text: contactMeFormBloc.state.email.value,
    );
    return BlocBuilder<ContactMeFormBloc, ContactMeFormState>(
      builder: (BuildContext context, ContactMeFormState state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: controller,
          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Email',
            hintText: 'example@mail.com',
            prefixIcon: const Icon(Icons.email_outlined),
            suffixIcon: state.email.pure
                ? null
                : state.email.valid
                    ? const Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.error_outline_rounded,
                        color: Colors.red,
                      ),
            errorText: state.email.invalid ? 'Enter a valid email' : null,
          ),
          onChanged: (String value) => contactMeFormBloc.add(
            EmailChanged(
              email: value,
            ),
          ),
        );
      },
    );
  }
}
