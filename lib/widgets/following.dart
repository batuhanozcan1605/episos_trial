import 'package:episos_trial/models/models.dart';
import 'package:episos_trial/screens/detailed_screen.dart';
import 'package:flutter/material.dart';

class Following extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Following({Key? key, required this.title, required this.contentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xbfffffff),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Segoe UI',
            ),
          ),
        ),
        Container(
          height: 165,
          child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return GestureDetector(
                  onTap: () => Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => DetailedScreen(detailed: content),
                    ),
                  ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(content.followingImageUrl!),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
