class NewsReaction {
  final String newsTitle;
  final String emotion;
  final String frame;

  NewsReaction({
    required this.newsTitle,
    required this.emotion,
    required this.frame,
  });

  @override
  String toString() {
    return '[$newsTitle] 감정: $emotion, 프레임: $frame';
  }
}
