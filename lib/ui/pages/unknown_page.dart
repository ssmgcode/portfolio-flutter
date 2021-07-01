import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/router/page_manager.dart';
import 'package:portfolio/ui/widgets/app_bar.dart';

/// Shows a page when no page was found based on route.
class UnknownPage extends StatelessWidget {
  /// Shows a page when no page was found based on route.
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Center(
        child: Column(
          children: <Widget>[
            // const Spacer(),
            Expanded(
              flex: 2,
              child: Lottie.asset(
                'assets/lost-animation.json',
              ),
            ),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "It seems you've requested a page that doesn't exist.",
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: () => RouterPageManager.of(context).openHomePage(),
              icon: const Icon(Icons.home_outlined),
              label: const Text('Go to Home'),
              style: TextButton.styleFrom(
                primary: Theme.of(context).accentColor,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
