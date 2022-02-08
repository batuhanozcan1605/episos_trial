import 'package:episos_trial/models/models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Episodes extends StatefulWidget {
  Content detailed;
  Episodes({required this.detailed});

  @override
  _EpisodesState createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {

  int i = 1;

  Future<void> readData() async {

    var sp = await SharedPreferences.getInstance();
    int i_new = sp.getInt("season") ?? 1;
    setState(() {
    i = i_new;
    });

  }

  @override
  Widget build(BuildContext context) {
    readData();
    var x = 0;
    final List episodesList = widget.detailed.episodes![i];
    final int episodes = episodesList.length;
    final int seasons = widget.detailed.episodes!.length;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(top: 5),
          sliver: SliverPersistentHeader(
              pinned: true,
              delegate: SliverContainerDelegate(
                widget: GestureDetector(
                  onTap: () =>
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Color(0xFF655746),
                              title: const Text('Hangi sezondasın?', style: TextStyle(
                                color: Colors.white,),),
                              content: setupAlertDialoadContainer(seasons, x),
                            );
                          }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Text(
                          '$i. Sezon',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
         SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => print('bölüme tiklandi.'),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Container(
                      color: Color(0xFF071B2A),
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: Text('${index + 1}. Bölüm : ${episodesList[index]}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Segoe UI',
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: episodes,
            ),
          ),
      ],
    );
  }
}


class SliverContainerDelegate extends SliverPersistentHeaderDelegate {
  final Widget widget;

  SliverContainerDelegate({required this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 30,
      color: Color(0xFF655746),
      child: widget,
    );
  }

  @override
  double get minExtent => 30;
  @override
  double get maxExtent => 30;

  @override
  bool shouldRebuild(SliverContainerDelegate oldDelegate) {
    return true;
  }
}

Widget setupAlertDialoadContainer(seasons, x) {

  Future<void> saveData(x) async {

    var sp = await SharedPreferences.getInstance();

    sp.setInt("season", x);
  }
  return Container(
    height: 300.0, // Change as per your requirement
    width: 300.0,// Change as per your requirement
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: seasons,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
           saveData(index+1);
           Navigator.pop(context);
          },
          tileColor: Color(0xFF655746),
          title: Text('${index+1}. Sezon',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Segoe UI',
            ),
          ),
        );
      },
    ),
  );
}
