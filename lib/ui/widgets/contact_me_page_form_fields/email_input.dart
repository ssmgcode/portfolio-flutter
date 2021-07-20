import 'package:flutter/material.dart';

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
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
        hintText: 'example@mail.com',
        prefixIcon: Icon(Icons.email_outlined),
      ),
    );
  }
}
