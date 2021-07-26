import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/config/app_theme.dart';
import 'package:portfolio/config/personal_information.dart';
import 'package:portfolio/utils/utils.dart' as utils
    show openUrlWithCopyToClipboardFallback;

/// The general footer of the application.
class Footer extends StatelessWidget {
  /// The general footer of the application.
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: DefaultTextStyle.of(context).style.color!.withOpacity(0.1),
            width: 5.0,
          ),
        ),
      ),
      child: Opacity(
        opacity: 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              AppTheme.logoSvg,
              height: 50,
              color: DefaultTextStyle.of(context).style.color,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'SSMG Code',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const _SocialMedia(),
          ],
        ),
      ),
    );
  }
}

class _SocialMedia extends StatelessWidget {
  const _SocialMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        _SocialMediaIcon(
          icon: Icon(Boxicons.bxl_github),
          url: PersonalInformation.githubProfileUrl,
          tooltip: 'GitHub',
        ),
        SizedBox(
          width: 10,
        ),
        _SocialMediaIcon(
          icon: Icon(Boxicons.bxl_instagram),
          url: PersonalInformation.instagramProfileUrl,
          tooltip: 'Instagram',
        ),
        SizedBox(
          width: 10,
        ),
        _SocialMediaIcon(
          icon: Icon(Boxicons.bxl_youtube),
          url: PersonalInformation.youtubeProfileUrl,
          tooltip: 'YouTube',
        ),
      ],
    );
  }
}

class _SocialMediaIcon extends StatelessWidget {
  const _SocialMediaIcon({
    Key? key,
    required this.icon,
    required this.url,
    this.tooltip,
  }) : super(key: key);

  final Widget icon;
  final String url;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await utils.openUrlWithCopyToClipboardFallback(url);
      },
      tooltip: tooltip,
      iconSize: 35,
      icon: icon,
    );
  }
}
