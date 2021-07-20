import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/app_bar.dart';
import 'package:portfolio/ui/widgets/contact_me_page_form_fields/email_input.dart';
import 'package:portfolio/ui/widgets/contact_me_page_form_fields/message_input.dart';
import 'package:portfolio/ui/widgets/contact_me_page_form_fields/name_input.dart';
import 'package:portfolio/ui/widgets/contact_me_page_form_fields/subject_input.dart';

/// Contains a form to send an email to contact me.
class ContactMePage extends StatelessWidget {
  /// Contains a form to send an email to contact me.
  const ContactMePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: LayoutBuilder(
        builder: (_, BoxConstraints boxConstraints) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: boxConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    child: Text(
                      'Contact Me',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  const _ContactMeForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactMeForm extends StatefulWidget {
  const _ContactMeForm({Key? key}) : super(key: key);

  @override
  __ContactMeFormState createState() => __ContactMeFormState();
}

class __ContactMeFormState extends State<_ContactMeForm> {
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _subjectFocusNode = FocusNode();
  final _messageFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        width: 700,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 15.0,
            ),
            child: Form(
              child: Column(
                children: <Widget>[
                  NameInput(
                    focusNode: _nameFocusNode,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  EmailInput(
                    focusNode: _emailFocusNode,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SubjectInput(
                    focusNode: _subjectFocusNode,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  MessageInput(
                    focusNode: _messageFocusNode,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.send_outlined),
                      label: const Text('Contact Me'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
