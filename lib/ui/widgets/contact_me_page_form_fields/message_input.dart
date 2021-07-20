import 'package:flutter/material.dart';

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
    return TextFormField(
      maxLines: 8,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Message',
        alignLabelWithHint: true,
      ),
    );
  }
}
