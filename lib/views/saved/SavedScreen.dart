import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 16),  // AppBar 아래 여백 추가 = Spacer
          Row( //LazyRow와 같음
            mainAxisAlignment: MainAxisAlignment.center,  // 중앙 정렬
            children: const [
              TopChipGroupFilter(),  // 필터 버튼
            ],
          ),
          Expanded(child: Container()), // 아래 본문 부분 (비워둠)
        ],
      ),
    );
  }
}


class TopChipGroupFilter extends StatelessWidget {
  const TopChipGroupFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Wrap(
        spacing: 8.0,
        children: const [
          Chip(label: Text("전체")),
          Chip(label: Text("중요")),
          Chip(label: Text("완료됨")),
        ],
      ),
    );
  }
}