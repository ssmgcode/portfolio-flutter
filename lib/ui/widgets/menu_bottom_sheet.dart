import 'package:flutter/material.dart';

/// A custom bottom sheet for mobile application menu.
class MenuBottomSheet extends StatelessWidget {
  /// A custom bottom sheet for mobile application menu.
  const MenuBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Theme.of(context).cardColor,
      child: const Text('Hi'),
    );
  }
}
