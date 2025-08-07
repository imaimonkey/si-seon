import 'reaction_store.dart'; // 같은 폴더 내에 있는 경우
import 'package:flutter/material.dart';
import '../../models/news_reaction.dart';

class NewsDetailPage extends StatefulWidget {
  final String title;
  final String content;

  NewsDetailPage({required this.title, required this.content});

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  final List<String> emotions = ['😀 공감', '😠 분노', '😢 슬픔', '😐 무관심'];
  final List<String> frames = [
    '시민 책임',
    '정부 책임',
    '기술 문제',
    '사회 구조 문제',
  ];

  String? selectedEmotion;
  String? selectedFrame;

  void _selectEmotion(String e) {
    setState(() {
      selectedEmotion = e;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('선택된 감정: $e')),
    );
  }

  void _selectFrame(String? f) {
    setState(() {
      selectedFrame = f;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('선택된 프레임: $f')),
    );
  }

  void _saveReaction() {
    if (selectedEmotion == null || selectedFrame == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('감정과 프레임을 모두 선택해주세요.')),
      );
      return;
    }

    final reaction = NewsReaction(
      newsTitle: widget.title,
      emotion: selectedEmotion!,
      frame: selectedFrame!,
    );

    ReactionStore.addReaction(reaction);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('반응이 저장되었습니다!')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('뉴스 상세')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(widget.content),
            Divider(height: 32),
            Text(
              '이 뉴스에 대한 감정 반응은?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8,
              children: emotions.map((e) {
                return ChoiceChip(
                  label: Text(e),
                  selected: selectedEmotion == e,
                  onSelected: (_) => _selectEmotion(e),
                );
              }).toList(),
            ),
            SizedBox(height: 24),
            Text(
              '당신이 본 의제(프레임)는?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              children: frames.map((f) {
                return RadioListTile<String>(
                  title: Text(f),
                  value: f,
                  groupValue: selectedFrame,
                  onChanged: _selectFrame,
                );
              }).toList(),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: _saveReaction,
                icon: Icon(Icons.save),
                label: Text('반응 저장하고 돌아가기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
