import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/ui/widgets/menu_bottom_sheet.dart';

/// Creates a custom bar navigation for the entire app
class CustomAppBar extends StatelessWidget {
  /// Creates a custom bar navigation for the entire app
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        // color: Colors.red,
        color: Theme.of(context).backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 5.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              'assets/ssmg-logo.svg',
              height: 50,
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => const MenuBottomSheet(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
