import 'package:flutter/material.dart';

/// Displays the projects view of the portfolio.
class ProjectsView extends StatelessWidget {
  /// Displays the projects view of the portfolio.
  const ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            color: Colors.red,
          ),
          const Text('Projects view'),
        ],
      ),
    );
  }
}
