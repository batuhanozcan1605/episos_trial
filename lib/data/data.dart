import 'dart:collection';
import 'package:episos_trial/assets.dart';
import 'package:episos_trial/models/content_model.dart';
import 'package:flutter/material.dart';

final Content strangerThingsContent =
    Content(name: 'Stranger Things', headerUrl: Assets.headerStrangerThings);

//Squid Game data
final Content headerSquidGame =
    Content(name: 'Squid Game', headerUrl: Assets.headerSquidGame);

final List<String> episodes = [

];

final List<Content> following = [
  const Content(name: 'Squid Game', followingImageUrl: Assets.followingSquidGame, headerUrl: Assets.headerSquidGame, episodes: Assets.episodesSquidGame),
  const Content(name: 'Aşk 101', followingImageUrl: Assets.followingAsk101),
  const Content(name: 'Breaking Bad', followingImageUrl: Assets.followingBreakingBad),
  const Content(name: 'Friends', followingImageUrl: Assets.followingFriends),
];

final List<Content> trending = [
  const Content(name: 'Squid Game', thumbnailUrl: Assets.thumbSquidGame, headerUrl: Assets.headerSquidGame, episodes: Assets.episodesSquidGame),
  const Content(name: 'Aşk 101', thumbnailUrl: Assets.thumbAsk101),
  const Content(name: 'La Casa de Papel', thumbnailUrl: Assets.thumbLacasa),
  const Content(name: 'You', thumbnailUrl: Assets.thumbYou),
];

final List<Content> legends = [
  const Content(name: 'Breaking Bad', thumbnailUrl: Assets.thumbBb),
  const Content(name: 'Doctor Who', thumbnailUrl: Assets.thumbDoctor),
  const Content(name: 'Prison Break', thumbnailUrl: Assets.thumbPrisonBreak),
  const Content(name: 'Game of Thrones', thumbnailUrl: Assets.thumbGot),
];

final List<Content> latest = [
  const Content(name: 'Locke Key', thumbnailUrl: Assets.thumbLockeKey),
  const Content(name: 'How To Sell Drugs Online (Fast)', thumbnailUrl: Assets.thumbHowToSell),
  const Content(name: 'My Name', thumbnailUrl: Assets.thumbMyName),
  const Content(name: 'The Billion Dollar COde', thumbnailUrl: Assets.thumbTheBillion),
];


