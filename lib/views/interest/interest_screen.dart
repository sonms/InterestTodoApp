
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class InterestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InterestScreen();
  }
}

class _InterestScreen extends State<InterestScreen> {
  final List<String> interest = ["카페", "음식점", "편의점", "마트", "주차장", "헤어샵", "+ 더 추가하기"];
  final List<String> _selectedInterest = [];

  void _handleInterest(String value) {
    setState(() {
      if (_selectedInterest.contains(value)) {
        _selectedInterest.remove(value); // 이미 선택된 경우 제거
      } else {
        _selectedInterest.add(value); // 선택되지 않은 경우 추가
      }
    });
    print(_selectedInterest);
  }

  Widget _buildInterestChip({required String value}) {
    return Material(
      color: Colors.transparent, // 배경 투명
      child: GestureDetector(
        onTap: () => _handleInterest(value),
        child: Chip(
          labelPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4), // 적절한 패딩 추가
          label: Text(value),
          avatar: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              'assets/images/akar-icons_scissor.svg', // 아이콘 경로
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          backgroundColor: _selectedInterest.contains(value) ? Colors.blueAccent.withOpacity(0.7) : Colors.grey[300], // 선택된 경우 색 변경
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap( //한 줄에 3개씩 들어가고 넘치면 자동 줄 바꿈됨
          spacing: 12, // 가로 간격
          runSpacing: 8, // 세로 간격
          children: interest.map((item) => _buildInterestChip(value: item)).toList(),
        ),
      ),
    );
  }
}