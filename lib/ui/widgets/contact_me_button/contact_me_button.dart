import 'package:flutter/material.dart';
import 'package:portfolio/router/page_manager.dart';

/// Creates a contact me button to go to contact me page.
class ContactMeButton extends StatelessWidget {
  /// Creates a contact me button to go to contact me page.
  const ContactMeButton({
    Key? key,
    this.isPrimary = true,
    this.width,
  }) : super(key: key);

  /// Whether the button has to look like a primary button or not.
  final bool isPrimary;

  /// Defines the width of the button. By default it takes only the needed
  /// space.
  final double? width;

  void _onPressed(BuildContext context) =>
      RouterPageManager.of(context).openProjectsPage();

  final _content = const Text('Contact Me');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: isPrimary
          ? ElevatedButton(
              onPressed: () => _onPressed(context),
              child: _content,
            )
          : OutlinedButton(
              onPressed: () => _onPressed(context),
              child: _content,
            ),
    );
  }
}
