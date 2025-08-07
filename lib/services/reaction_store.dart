import '../models/news_reaction.dart';

class ReactionStore {
  static final List<NewsReaction> _reactions = [];

  static void addReaction(NewsReaction reaction) {
    _reactions.add(reaction);
  }

  static List<NewsReaction> get reactions => _reactions;

  static void clear() {
    _reactions.clear();
  }
}
