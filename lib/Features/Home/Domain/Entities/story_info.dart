class StoryInfo{
  final String name;
  final String url;
  final bool isLive;

  StoryInfo({
    required this.name,
    required this.url,
    this.isLive = false,
  });
}