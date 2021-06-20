import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double _mobileDisplayBreakpoint = 768;
const double _posterHeight = 300;

/// Main poster showing a presentation
class SSMGPoster extends StatelessWidget {
  /// Main poster showing a presentation
  const SSMGPoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const <Widget>[
        _Background(),
        _Texts(),
      ],
    );
  }
}

/// Creates a blue rectangle with white circles on it.
class _Background extends StatelessWidget {
  /// Creates a blue rectangle with white circles on it.
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: _posterHeight,
        width: size.width < 1000 ? size.width : 1000,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}

class _Texts extends StatelessWidget {
  const _Texts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: 700,
      height: _posterHeight,
      // color: Colors.green,
      child: size.width < _mobileDisplayBreakpoint
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'SSMG Code',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            size.width < _mobileDisplayBreakpoint ? 50 : 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    /* Text(
                      'Full Stack Development',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            size.width < _mobileDisplayBreakpoint ? 20 : 28,
                      ),
                    ), */
                    AnimatedTextKit(
                      animatedTexts: <AnimatedText>[
                        TypewriterAnimatedText(
                          'Full Stack Developer',
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize:
                                size.width < _mobileDisplayBreakpoint ? 20 : 28,
                          ),
                          speed: const Duration(
                            milliseconds: 100,
                          ),
                        ),
                      ],
                      pause: const Duration(
                        milliseconds: 2000,
                      ),
                      repeatForever: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset(
                  'assets/ssmg-logo.svg',
                  height: size.width < _mobileDisplayBreakpoint ? 100 : 150,
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text(
                      'SSMG Code',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Full Stack Development',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  'assets/ssmg-logo.svg',
                  height: 150,
                ),
              ],
            ),
    );
  }
}
