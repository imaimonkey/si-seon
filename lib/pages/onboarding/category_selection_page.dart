import 'package:flutter/material.dart';

class CategorySelectionPage extends StatefulWidget {
  @override
  _CategorySelectionPageState createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  final List<String> categories = [
    '정치',
    '경제',
    '사회',
    '문화',
    'IT',
    '환경',
    '국제',
    '교육',
    '스포츠'
  ];

  final Set<String> selected = {};

  void _toggleCategory(String category, bool isSelected) {
    setState(() {
      if (isSelected) {
        selected.add(category);
      } else {
        selected.remove(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('관심사 선택')),
      body: ListView(
        children: categories.map((category) {
          return CheckboxListTile(
            title: Text(category),
            value: selected.contains(category),
            onChanged: (checked) => _toggleCategory(category, checked!),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: 관심사 저장 로직 추가 가능
          Navigator.pushReplacementNamed(context, '/home'); // ✅ 홈으로 이동
        },
        label: Text('다음'),
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}
