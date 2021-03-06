import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/contact_me_form_bloc/contact_me_form_bloc.dart';

/// The field where user will enter their name.
class NameInput extends StatelessWidget {
  /// The field where user will enter their name.
  const NameInput({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  /// The [FocusNode] to control if the focus is on this input.
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final contactMeFormBloc = BlocProvider.of<ContactMeFormBloc>(context);
    final controller = TextEditingController(
      text: contactMeFormBloc.state.name.value,
    );
    return BlocBuilder<ContactMeFormBloc, ContactMeFormState>(
      builder: (BuildContext context, ContactMeFormState state) {
        return TextFormField(
          autofocus: true,
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Name',
            hintText: 'Name',
            prefixIcon: const Icon(Icons.person_outlined),
            suffixIcon: state.name.pure
                ? null
                : state.name.valid
                    ? const Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.error_outline_rounded,
                        color: Colors.red,
                      ),
            errorText: state.name.invalid
                ? 'Name must have at least 2 characters.'
                : null,
          ),
          onChanged: (String value) => contactMeFormBloc.add(
            NameChanged(
              name: value,
            ),
          ),
        );
      },
    );
  }
}
