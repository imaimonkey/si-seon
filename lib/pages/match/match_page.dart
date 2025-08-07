
import 'package:flutter/material.dart';
import '../../services/reaction_store.dart';
import '../../models/news_reaction.dart';

class MatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<NewsReaction> reactions = ReactionStore.reactions;

    return Scaffold(
      appBar: AppBar(title: Text('시선일치 매칭 결과')),
      body: reactions.isEmpty
          ? Center(child: Text('아직 저장된 반응이 없습니다.'))
          : ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: reactions.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final r = reactions[index];
                return ListTile(
                  title: Text(
                    r.newsTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('감정: ${r.emotion} / 프레임: ${r.frame}'),
                  leading: Icon(Icons.check_circle_outline),
                );
              },
            ),
    );
  }
}
