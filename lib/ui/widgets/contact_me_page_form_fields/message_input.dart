import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/contact_me_form_bloc/contact_me_form_bloc.dart';

/// The field where user will enter the message.
class MessageInput extends StatelessWidget {
  /// The field where user will enter the message.
  const MessageInput({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  /// The [FocusNode] to control if the focus is on this input.
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final contactMeFormBloc = BlocProvider.of<ContactMeFormBloc>(context);
    final controller = TextEditingController(
      text: contactMeFormBloc.state.message.value,
    );
    return BlocBuilder<ContactMeFormBloc, ContactMeFormState>(
      builder: (BuildContext context, ContactMeFormState state) {
        return TextFormField(
          maxLines: 6,
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Message',
            alignLabelWithHint: true,
            suffixIcon: state.message.pure
                ? null
                : state.message.valid
                    ? const Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.error_outline_rounded,
                        color: Colors.red,
                      ),
            errorText: state.message.invalid
                ? 'Message must have at least 2 characters.'
                : null,
          ),
          onChanged: (String value) => contactMeFormBloc.add(
            MessageChanged(
              message: value,
            ),
          ),
        );
      },
    );
  }
}
