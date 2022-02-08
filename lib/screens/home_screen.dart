import 'package:episos_trial/data/data.dart';
import 'package:episos_trial/widgets/content_header.dart';
import 'package:episos_trial/widgets/custom_app_bar.dart';
import 'package:episos_trial/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) :  super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffset = 0.0;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: strangerThingsContent),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 2.0),
            sliver: SliverToBoxAdapter(
              child: Following(
                key: PageStorageKey('following'),
                title: "Takip Edilenler",
                contentList: following,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('trending'),
              title: 'Gündemdekiler',
              contentList: trending,
             ),
            ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('legends'),
              title: 'Efsaneler',
              contentList: legends,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('latest'),
              title: 'Son Çıkan',
              contentList: latest,
            ),
          ),
        ],
      ),
    );
  }
}
