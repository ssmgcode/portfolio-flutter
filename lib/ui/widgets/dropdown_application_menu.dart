import 'package:flutter/material.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:portfolio/ui/widgets/application_menu.dart';
import 'package:portfolio/ui/widgets/custom_card.dart';

/// Application menu when used in web.
class DropdownApplicationMenu extends StatelessWidget {
  /// Application menu when used in web.
  DropdownApplicationMenu({Key? key}) : super(key: key);

  final _controller = CustomPopupMenuController();

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      menuBuilder: () => TweenAnimationBuilder(
        duration: const Duration(
          milliseconds: 300,
        ),
        tween: Tween<double>(
          begin: 0.1,
          end: 1,
        ),
        curve: Curves.fastOutSlowIn,
        builder: (_, double value, Widget? child) => Transform.scale(
          scale: value,
          alignment: Alignment.topRight,
          child: child!,
        ),
        child: const SizedBox(
          width: 500,
          child: CustomCard(
            displayHeader: false,
            child: ApplicationMenu(),
          ),
        ),
      ),
      pressType: PressType.singleClick,
      controller: _controller,
      verticalMargin: -10,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.more_horiz),
      ),
    );
  }
}
