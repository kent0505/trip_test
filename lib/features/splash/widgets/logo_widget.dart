import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: Stack(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/suitcase.png',
                height: 280,
                width: 280,
              ),
            ],
          ),
          Positioned(
            right: -2,
            bottom: -30,
            child: Image.asset(
              'assets/icons/globus.png',
              height: 280,
              width: 280,
            ),
          ),
        ],
      ),
    );
  }
}
