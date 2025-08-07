import 'package:flutter/material.dart';
import 'pages/onboarding/category_selection_page.dart';
import 'pages/feed/news_feed_page.dart';
import 'pages/match/match_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(SiseonApp());
}

class SiseonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '시선일치',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Pretendard', // 없으면 제거해도 무방
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CategorySelectionPage(), // ✅ 초기 진입 페이지 변경
        '/home': (context) => HomePage(),    
        '/feed': (context) => NewsFeedPage(),
        '/match': (context) => MatchPage(),
      },
    );
  }
}
