import 'dart:ui';
import 'package:episos_trial/models/content_model.dart';
import 'package:episos_trial/widgets/episodes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:episos_trial/assets.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  Content detailed;
  DetailedScreen({required this.detailed});

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen>  {

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final Map mapOfEpisodes = widget.detailed.episodes!;
    final int seasons = widget.detailed.episodes!.length;


    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Color(0xff03101a),
                expandedHeight: screenHeight / 2.2,
                leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 18.5),
                    child: SizedBox(
                        width: screenHeight / 26,
                        height: screenHeight / 26,
                        child: SvgPicture.asset(Assets.iconBack)),
                  ),
                ),
                stretch: true,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  stretchModes: const <StretchMode>[
                    StretchMode.blurBackground,
                    StretchMode.zoomBackground,
                  ],
                  title: Text(widget.detailed.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Segoe UI')),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        child: Image.asset(
                          widget.detailed.headerUrl!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        child: Container(
                          height: 170,
                          width: screenWidth,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.0, -1.0),
                              end: Alignment(0.0, 1.0),
                              colors: [Color(0x00051622), Color(0xff03101a)],
                              stops: [0.0, 1],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 5),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              '2021 $seasons sezon ${episodeCounter(mapOfEpisodes)} bölüm',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/images/madalya.svg'),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Türkiyede en çok konuşulan dizi',
                              style: TextStyle(
                                color: Color(0xFFDEB992),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Container(
                          width: screenWidth,
                          child: const Flexible(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, top: 8, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(Assets.followCircleButton),
                                  SizedBox(height: 5),
                                  const Text(
                                    'Takip et',
                                    style: TextStyle(
                                      color: Color(0xBFFFFFFF),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    labelColor: Color(0xFFDEB992),
                    unselectedLabelColor: Colors.grey,
                    indicator: UnderlineTabIndicator(
                      borderSide:
                          BorderSide(color: Color(0xFFDEB992), width: 4),
                      insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 43.0),
                    ),
                    indicatorColor: Color(0xFFDEB992),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(text: "BÖLÜMLER"),
                      Tab(text: "GENEL"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              Episodes(
                detailed: widget.detailed
              ),
              Text('Genel Tartışma Postları'),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
      color: Color(0xFF071B2A),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

int episodeCounter(mapOfEpisodes) {

  int a = 0;
  var counter = 1;
  while(counter <= mapOfEpisodes.length) {
    var episodesList = mapOfEpisodes[counter];
    var temp = episodesList.length;
    a = temp + a;
    counter += 1;
  }

  return a;

}