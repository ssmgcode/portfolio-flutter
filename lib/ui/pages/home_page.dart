import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/app_bar.dart';
import 'package:portfolio/ui/widgets/personal_information.dart';
import 'package:portfolio/ui/widgets/ssmg_poster.dart';

/// Displays the root view of the portfolio.
class HomePage extends StatelessWidget {
  /// Displays the root view of the portfolio.
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const <Widget>[
            SSMGPoster(),
            PersonalInformation(),
          ],
        ),
      ),
    );
  }
}
