import 'package:flutter/material.dart';

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
    return TextFormField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Subject',
        hintText: 'Subject',
        prefixIcon: Icon(Icons.subject_outlined),
      ),
    );
  }
}
