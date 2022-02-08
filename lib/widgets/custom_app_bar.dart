import 'package:episos_trial/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  CustomAppBar({this.scrollOffset = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Color(0xff03101a).withOpacity((scrollOffset / 350).clamp(0, 0.75).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            SvgPicture.asset(Assets.episosLogo),
            Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.search, color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
