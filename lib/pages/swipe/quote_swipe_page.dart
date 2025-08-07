import 'package:flutter/material.dart';

class QuoteSwipePage extends StatefulWidget {
  @override
  _QuoteSwipePageState createState() => _QuoteSwipePageState();
}

class _QuoteSwipePageState extends State<QuoteSwipePage> {
  final List<Map<String, String>> quotes = [
    {
      'person': '버락 오바마',
      'quote': '우리는 변화가 아니라 변화를 만들어내는 존재다.',
    },
    {
      'person': '일론 머스크',
      'quote': '실패는 옵션이다. 시도조차 하지 않는 것이 진짜 실패다.',
    },
    {
      'person': '이재명',
      'quote': '기회는 평등하고, 과정은 공정하며, 결과는 정의로워야 한다.',
    },
  ];

  List<String> liked = [];
  List<String> disliked = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('인용문 스와이프')),
      body: quotes.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('모든 카드를 완료했습니다.'),
                  SizedBox(height: 12),
                  Text('❤️ 공감한 문장: ${liked.length}개'),
                  Text('❌ 비공감한 문장: ${disliked.length}개'),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: Dismissible(
                key: Key(quotes[0]['quote']!),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  final quote = quotes.removeAt(0);
                  final quoteText = quote['quote']!;
                  final likedIt = direction == DismissDirection.endToStart ? false : true;

                  setState(() {
                    if (likedIt) {
                      liked.add(quoteText);
                    } else {
                      disliked.add(quoteText);
                    }
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(likedIt ? '❤️ 공감' : '❌ 비공감')),
                  );
                },
                background: swipeBackground('❤️ 공감', Alignment.centerLeft, Colors.green),
                secondaryBackground: swipeBackground('❌ 비공감', Alignment.centerRight, Colors.red),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '"${quotes[0]['quote']}"',
                          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Text('- ${quotes[0]['person']}', style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget swipeBackground(String text, Alignment alignment, Color color) {
    return Container(
      alignment: alignment,
      color: color,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
