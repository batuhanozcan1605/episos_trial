import 'package:episos_trial/models/models.dart';
import 'package:episos_trial/screens/detailed_screen.dart';
import 'package:flutter/material.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const ContentList({Key? key, required this.title, required this.contentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
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
            height: 200.0,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
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
                    child: Container(margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      height: 170.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(content.thumbnailUrl!),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                  );
                },
            ),
          )
        ],
      ),
    );
  }
}
