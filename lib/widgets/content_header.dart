import 'package:episos_trial/assets.dart';
import 'package:episos_trial/models/models.dart';
import 'package:episos_trial/widgets/header_icon_button.dart';
import 'package:flutter/material.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  ContentHeader({required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Stack(
      children: [
        Container(
          height: screenHeight/1.88,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.headerUrl!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: screenWidth,
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.17),
                colors: [Color(0x00051622), Color(0xff03101a)],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),
        Container(
          width: screenWidth,
          height: 250,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [Color(0xff03101a), Color(0x00565f66)],
              stops: [0.0, 1.0],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: screenHeight/21.54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => print('takip edildi') ,
                child: HeaderIconButton(
                  svgButton: Assets.followButton,
                  title: "Takip Et",

                ),
              ),
              GestureDetector(
                onTap: () => print('diziye gidildi'),
                child: HeaderIconButton(
                  svgButton: Assets.goButton,
                  title: "Diziye git",

                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
