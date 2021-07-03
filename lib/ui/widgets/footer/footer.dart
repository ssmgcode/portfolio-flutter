import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/config/app_theme.dart';
import 'package:portfolio/config/personal_information.dart';
import 'package:portfolio/services/snackbar_service.dart';
import 'package:url_launcher/url_launcher.dart';

/// The general footer of the application.
class Footer extends StatelessWidget {
  /// The general footer of the application.
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      // height: 250,
      width: double.infinity,
      color: Theme.of(context).cardColor,
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
          iconName: 'assets/github.svg',
          url: PersonalInformation.githubProfileUrl,
        ),
        SizedBox(
          width: 10,
        ),
        _SocialMediaIcon(
          iconName: 'assets/instagram.svg',
          url: PersonalInformation.instagramProfileUrl,
        ),
        SizedBox(
          width: 10,
        ),
        _SocialMediaIcon(
          iconName: 'assets/youtube.svg',
          url: PersonalInformation.youtubeProfileUrl,
        ),
      ],
    );
  }
}

class _SocialMediaIcon extends StatelessWidget {
  const _SocialMediaIcon({
    Key? key,
    required this.iconName,
    required this.url,
  }) : super(key: key);

  final String iconName;
  final String url;

  @override
  Widget build(BuildContext context) {
    final colorForSvg =
        DefaultTextStyle.of(context).style.color!.withOpacity(0.6);
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(
          ClipboardData(
            text: url,
          ),
        );
        SnackBarService.showInformationSnackBar('URL copied to clipboard');
        if (await canLaunch(url)) {
          // await launch(url);
        }
      },
      child: SvgPicture.asset(
        iconName,
        color: colorForSvg,
        height: 35,
      ),
    );
  }
}
