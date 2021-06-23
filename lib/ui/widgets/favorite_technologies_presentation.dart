import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Creates a text with animated text kit showing my favorite technologies.
class FavoriteTechnoloiesPresentation extends StatelessWidget {
  /// Creates a text with animated text kit showing my favorite technologies.
  const FavoriteTechnoloiesPresentation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Lottie.asset(
          'assets/heart_animation.json',
          height: 170,
          width: 170,
        ),
        SizedBox(
          width: 200,
          child: DefaultTextStyle.merge(
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              pause: const Duration(
                milliseconds: 0,
              ),
              animatedTexts: <AnimatedText>[
                RotateAnimatedText(
                  'Flutter',
                  duration: const Duration(
                    milliseconds: 1500,
                  ),
                ),
                RotateAnimatedText(
                  'Dart',
                  duration: const Duration(
                    milliseconds: 1500,
                  ),
                ),
                RotateAnimatedText(
                  'Go',
                  duration: const Duration(
                    milliseconds: 1500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
