import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:portfolio/bloc/contact_me_form_bloc/contact_me_form_bloc.dart';
import 'package:portfolio/services/snackbar_service.dart';
import 'package:portfolio/ui/widgets/app_bar.dart';
import 'package:portfolio/ui/widgets/contact_me_page_form_fields/email_input.dart';
import 'package:portfolio/ui/widgets/contact_me_page_form_fields/message_input.dart';
import 'package:portfolio/ui/widgets/contact_me_page_form_fields/name_input.dart';
import 'package:portfolio/ui/widgets/contact_me_page_form_fields/subject_input.dart';
import 'package:portfolio/ui/widgets/contact_me_page_form_fields/submit_button.dart';
import 'package:portfolio/ui/widgets/footer/footer.dart';

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
                  const Spacer(),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 252,
                    child: Footer(),
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
  void initState() {
    super.initState();
    _nameFocusNode.addListener(() {
      if (!_nameFocusNode.hasFocus) {
        BlocProvider.of<ContactMeFormBloc>(context).add(NameUnfocused());
      }
    });
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        BlocProvider.of<ContactMeFormBloc>(context).add(EmailUnfocused());
      }
    });
    _subjectFocusNode.addListener(() {
      if (!_subjectFocusNode.hasFocus) {
        BlocProvider.of<ContactMeFormBloc>(context).add(SubjectUnfocused());
      }
    });
    _messageFocusNode.addListener(() {
      if (!_messageFocusNode.hasFocus) {
        BlocProvider.of<ContactMeFormBloc>(context).add(MessageUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _subjectFocusNode.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }

  void unfocusActiveField() {
    _nameFocusNode.unfocus();
    _emailFocusNode.unfocus();
    _subjectFocusNode.unfocus();
    _messageFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final contactMeFormBloc = BlocProvider.of<ContactMeFormBloc>(context);
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
            child: BlocConsumer<ContactMeFormBloc, ContactMeFormState>(
              listener: (BuildContext context, ContactMeFormState state) {
                if (state.status.isSubmissionSuccess) {
                  SnackBarService.messengerKey.currentState!
                      .hideCurrentSnackBar();
                  SnackBarService.showSuccessSnackBar(
                    message: 'Thank you for contacting me!',
                  );
                  contactMeFormBloc.add(ResetForm());
                }
                if (state.status.isSubmissionFailure) {
                  SnackBarService.messengerKey.currentState!
                      .hideCurrentSnackBar();
                  SnackBarService.showErrorSnackBar(
                    message: "Can't send the email, try again later.",
                  );
                }
              },
              buildWhen: (_, ContactMeFormState state) => state.status.isPure,
              builder: (_, __) => Form(
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
                    ContactMeFormSubmitButton(
                      onPressed: unfocusActiveField,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
