import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchScreen();
  }
}

class _SearchScreen extends State<SearchScreen> {

  final myController = TextEditingController();

  void _onSearchClicked() {
    String searchText = myController.text;
    if (searchText.isNotEmpty) {
      print("Searching for: $searchText");
    } else {
      print("검색어가 비어 있습니다.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: '검색어를 입력하세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _onSearchClicked,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}