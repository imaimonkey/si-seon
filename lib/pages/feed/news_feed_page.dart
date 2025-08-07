import 'package:flutter/material.dart';
import 'news_detail_page.dart';

class NewsFeedPage extends StatelessWidget {
  final List<Map<String, String>> newsList = [
    {
      'title': '기후 변화, 한국에 미치는 영향은?',
      'summary': '기후위기로 인한 장마, 폭염의 증가가 우리 일상에 어떤 영향을 미칠까?',
    },
    {
      'title': 'AI가 만든 예술, 진짜 예술인가?',
      'summary': '생성형 AI가 창작한 작품을 예술로 볼 수 있는가에 대한 논쟁이 가열되고 있다.',
    },
    {
      'title': '2030세대, 정치 무관심에서 벗어나나',
      'summary': '최근 정치 뉴스 소비와 참여가 늘어난 2030세대의 변화 조짐.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('뉴스 피드')),
      body: ListView.separated(
        padding: EdgeInsets.all(12),
        itemCount: newsList.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final news = newsList[index];
          return ListTile(
            title: Text(
              news['title'] ?? '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(news['summary'] ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(
                    title: news['title'] ?? '',
                    content: '여기에 뉴스 전체 내용을 보여줍니다.\n\n(예시) ${news['summary'] ?? ''}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
