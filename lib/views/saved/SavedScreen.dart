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


class TopChipGroupFilter extends StatefulWidget {
  const TopChipGroupFilter({super.key});

  @override
  _TopChipGroupFilterState createState() => _TopChipGroupFilterState();
}

class _TopChipGroupFilterState extends State<TopChipGroupFilter> {
  String _selectedChip = "전체"; // 선택된 Chip을 저장

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Wrap(
        spacing: 8.0,
        children: [
          ActionChip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("전체"),
                if (_selectedChip == "전체") Icon(Icons.check, size: 18) // 체크 아이콘 추가
              ],
            ),
            onPressed: () {
              setState(() {
                _selectedChip = "전체";
              });
            },
          ),
          ActionChip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("중요"),
                if (_selectedChip == "중요") Icon(Icons.check, size: 18)
              ],
            ),
            onPressed: () {
              setState(() {
                _selectedChip = "중요";
              });
            },
          ),
          ActionChip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("완료됨"),
                if (_selectedChip == "완료됨") Icon(Icons.check, size: 18)
              ],
            ),
            onPressed: () {
              setState(() {
                _selectedChip = "완료됨";
              });
            },
          ),
        ],
      ),
    );
  }
}