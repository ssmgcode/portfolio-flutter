import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double _mobileDisplayBreakpoint = 768;
const double _posterHeight = 300;

/// Main poster showing a presentation
class Presentation extends StatelessWidget {
  /// Main poster showing a presentation
  const Presentation({Key? key}) : super(key: key);

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
        width: size.width < 1000 ? size.width * .95 : 1000,
        decoration: const BoxDecoration(
          color: Color(0xff0f2636),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: size.width * 0.005,
              top: 5,
              child: _buildCircle(
                size: 50,
                borderRadius: 20,
              ),
            ),
            Positioned(
              top: 50,
              child: _buildCircle(
                size: 200,
              ),
            ),
            Positioned(
              right: size.width * 0.25,
              child: _buildCircle(
                size: 150,
              ),
            ),
            Positioned(
              bottom: 50,
              right: size.width * 0.02,
              child: _buildCircle(
                size: 350,
              ),
            ),
            Positioned(
              left: size.width * 0.2,
              top: -200,
              child: _buildCircle(
                size: 300,
              ),
            ),
            Positioned(
              left: size.width * 0.2,
              bottom: 80,
              child: _buildCircle(
                size: 60,
                borderRadius: 20,
              ),
            ),
            Positioned(
              left: size.width * 0.5,
              top: 30,
              child: _buildCircle(
                size: 90,
                borderRadius: 30,
              ),
            ),
            Positioned(
              left: size.width * 0.4,
              top: 90,
              child: _buildCircle(
                size: 120,
              ),
            ),
            Positioned(
              left: size.width * 0.3,
              top: 10,
              child: _buildCircle(
                size: 50,
              ),
            ),
            Positioned(
              left: size.width * 0.5,
              bottom: -200,
              child: _buildCircle(
                size: 350,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildCircle({required double size, double? borderRadius}) {
    borderRadius = borderRadius ?? size;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: const Color.fromRGBO(255, 255, 255, 0.05),
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
                          'Full Stack Development',
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
                  'images/ssmg-logo.svg',
                  height: 150,
                ),
              ],
            ),
    );
  }
}
