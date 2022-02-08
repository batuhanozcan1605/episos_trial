import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderIconButton extends StatelessWidget {
  final String svgButton;
  final String title;

  HeaderIconButton({
    required this.svgButton,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x59C89E72),
                    offset: Offset(0, 0),
                    spreadRadius: 10,
                    blurRadius: 9,
                  ),
                ],
              ),
            ),
            SvgPicture.asset(svgButton)
          ],
        ),
        const SizedBox(
          width: 5.4,
        ),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 11,
            color: Color(0xffdeb992),
            fontWeight: FontWeight.w600,
            shadows: [
              Shadow(
                color: Color(0x40000000),
                offset: Offset(0, 10),
                blurRadius: 15,
              )
            ],
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
