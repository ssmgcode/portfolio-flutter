import 'package:flutter/material.dart';

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
    return TextFormField(
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Name',
        hintText: 'Name',
        prefixIcon: Icon(Icons.person_outlined),
      ),
    );
  }
}
