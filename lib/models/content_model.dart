class Content {
  final String name;
  final String? thumbnailUrl;
  final String? followingImageUrl;
  final String? headerUrl;
  final String? description;
  final Map? episodes;

  const Content({
      required this.name,
      this.thumbnailUrl,
      this.followingImageUrl,
      this.headerUrl,
      this.description,
      this.episodes,
  });
}
