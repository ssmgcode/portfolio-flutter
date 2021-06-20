import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/personal_information.dart';
import 'package:portfolio/ui/widgets/ssmg_poster.dart';

/// Displays the root page of the portfolio.
class MainView extends StatelessWidget {
  /// Displays the root page of the portfolio.
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: const <Widget>[
          SSMGPoster(),
          PersonalInformation(),
        ],
      ),
    );
  }
}
