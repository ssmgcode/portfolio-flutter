import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/app_bar.dart';

/// Contains a form to send an email to contact me.
class ContactMePage extends StatelessWidget {
  /// Contains a form to send an email to contact me.
  const ContactMePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
    );
  }
}
