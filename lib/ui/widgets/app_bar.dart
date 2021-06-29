import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/router/page_manager.dart';
import 'package:portfolio/ui/widgets/application_menu.dart';

/// Builds the global application [AppBar].
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    // Use a [Builder] to get the right context.
    title: Builder(
      builder: (BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => RouterPageManager.of(context).openHomePage(),
          child: SvgPicture.asset(
            'assets/ssmg-logo.svg',
            height: 30,
            color: DefaultTextStyle.of(context).style.color,
          ),
        ),
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(10.0),
      ),
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => const ApplicationMenu(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10.0),
              ),
            ),
          );
        },
        icon: const Icon(Icons.more_horiz),
      ),
    ],
  );
}
