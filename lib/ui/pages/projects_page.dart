import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/app_bar.dart';

/// Displays the root view of the portfolio.
class ProjectsPage extends StatelessWidget {
  /// Displays the root view of the portfolio.
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const <Widget>[
            Text('Projects page'),
          ],
        ),
      ),
    );
  }
}
