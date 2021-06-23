import 'package:flutter/material.dart';

/// A custom card to display sections of my personal information.
class CustomCard extends StatelessWidget {
  /// A custom card to display sections of my personal information.
  const CustomCard({
    Key? key,
    this.icon,
    this.title,
    required this.child,
    this.displayHeader = true,
  })  : assert(title != null || icon != null || displayHeader != true,
            'Provide title and icon to show the Header'),
        super(key: key);

  /// The child that is displayed as the body of the card.
  final Widget child;

  /// The icon for the header of the card.
  final IconData? icon;

  /// The title for the header of the card.
  final String? title;

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
          fontFamily: 'Inter',
          fontSize: 18,
        ),
        child: Column(
          children: [
            if (displayHeader)
              _CustomCardHeader(
                icon: icon!,
                title: title!,
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
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Icon(
            icon,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
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
