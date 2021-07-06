import 'package:flutter/material.dart';

/// A custom card to display sections of my personal information.
class CustomCard extends StatelessWidget {
  /// A custom card to display sections of my personal information.
  const CustomCard({
    Key? key,
    required this.child,
    this.actionIcon,
    this.actionName,
    this.displayHeader = true,
    this.icon,
    this.onActionPressed,
    this.title,
  })  : assert(
          title != null ||
              icon != null ||
              actionName != null ||
              actionIcon != null ||
              onActionPressed != null ||
              displayHeader != true,
          'Provide title and icon to show the Header',
        ),
        super(key: key);

  /// The child that is displayed as the body of the card.
  final Widget child;

  /// The icon for the header of the card.
  final IconData? icon;

  /// The title for the header of the card.
  final String? title;

  /// The name for the action in the header.
  final String? actionName;

  /// THe icon for the action in the header.
  final IconData? actionIcon;

  /// The function when the action in the header is pressed.
  final void Function()? onActionPressed;

  /// If marked as false, [title] and [icon] will be ignored.
  final bool displayHeader;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).cardColor,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 0,
            spreadRadius: 1,
            color: Color.fromRGBO(0, 0, 0, 0.15),
          ),
        ],
      ),
      child: DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (displayHeader)
              _CustomCardHeader(
                icon: icon,
                title: title,
                actionIcon: actionIcon,
                actionName: actionName,
                onActionPressed: onActionPressed,
              ),
            _CustomCardBody(child: child),
          ],
        ),
      ),
    );
  }
}

class _CustomCardHeader extends StatelessWidget {
  const _CustomCardHeader({
    Key? key,
    this.actionIcon,
    this.actionName,
    this.icon,
    this.onActionPressed,
    this.title,
  }) : super(key: key);

  final IconData? icon;
  final String? title;
  final String? actionName;
  final IconData? actionIcon;
  final void Function()? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              if (icon != null)
                Icon(
                  icon,
                ),
              if (icon != null)
                const SizedBox(
                  width: 10,
                ),
              if (title != null)
                Text(
                  title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          TextButton(
            onPressed: onActionPressed,
            style: TextButton.styleFrom(
              primary: Theme.of(context).accentColor,
            ),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                if (actionName != null) Text(actionName!),
                const SizedBox(
                  width: 10,
                ),
                if (actionIcon != null) Icon(actionIcon!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomCardBody extends StatelessWidget {
  const _CustomCardBody({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: child,
    );
  }
}
