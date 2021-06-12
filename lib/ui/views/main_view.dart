import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double _mobileDisplayBreakpoint = 768;
const double _posterHeight = 300;

/// Displays the root page of the portfolio.
class MainView extends StatelessWidget {
  /// Displays the root page of the portfolio.
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        _Poster(),
      ],
    );
  }
}

/// Creates a blue rectangle with circle in the background and a name in the
/// front.
class _Poster extends StatelessWidget {
  /// Creates a blue rectangle with circle in the background and a name in the
  /// front.
  const _Poster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const <Widget>[
        _Background(),
        _Presentation(),
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
    final displayWidth = MediaQuery.of(context).size.width;
    return Container(
      color: const Color(0xff0f2636),
      height: _posterHeight,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: displayWidth * 0.005,
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
            right: displayWidth * 0.25,
            child: _buildCircle(
              size: 150,
            ),
          ),
          Positioned(
            bottom: 50,
            right: displayWidth * 0.02,
            child: _buildCircle(
              size: 350,
            ),
          ),
          Positioned(
            left: displayWidth * 0.2,
            top: -200,
            child: _buildCircle(
              size: 300,
            ),
          ),
          Positioned(
            left: displayWidth * 0.2,
            bottom: 80,
            child: _buildCircle(
              size: 60,
              borderRadius: 20,
            ),
          ),
          Positioned(
            left: displayWidth * 0.5,
            top: 30,
            child: _buildCircle(
              size: 90,
              borderRadius: 30,
            ),
          ),
          Positioned(
            left: displayWidth * 0.4,
            top: 90,
            child: _buildCircle(
              size: 120,
            ),
          ),
          Positioned(
            left: displayWidth * 0.3,
            top: 10,
            child: _buildCircle(
              size: 50,
            ),
          ),
          Positioned(
            left: displayWidth * 0.5,
            bottom: -200,
            child: _buildCircle(
              size: 350,
            ),
          ),
          _buildFrame(),
        ],
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

  Container _buildFrame() {
    return Container(
      width: double.infinity,
      height: _posterHeight,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xff004aad),
          ),
        ),
      ),
    );
  }
}

class _Presentation extends StatelessWidget {
  const _Presentation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 700,
      height: _posterHeight,
      // color: Colors.green,
      child: displayWidth < _mobileDisplayBreakpoint
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
                            displayWidth < _mobileDisplayBreakpoint ? 50 : 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Full Stack Development',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            displayWidth < _mobileDisplayBreakpoint ? 20 : 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset(
                  'images/ssmg-logo.svg',
                  height: displayWidth < _mobileDisplayBreakpoint ? 100 : 150,
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
