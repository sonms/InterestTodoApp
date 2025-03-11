import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreen createState() => _HomeScreen();

}

class _HomeScreen extends State<HomeScreen> {
  final List<String> items = List.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
        /*ListTile(
                  leading: Icon(Icons.star),
                  title: Text(items[index]),
                  subtitle: Text("Subtitle for ${items[index]}"),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${items[index]} 클릭됨")),
                    );
                  },
                );*/
        return ItemCard(
            title: index.toString(),
            subTitle: "test",
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${items[index]} 클릭됨")),
              );
            },
          );
        }, separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 10);
        },
      )
    );
  }
}
/*
class ListViewItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback? onTap; //onClick : () -> Unit과 같음

  const ListViewItem({super.key, required this.title, required this.subTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent, // 배경을 투명하게 설정
        child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10), // 터치 효과를 모서리에 맞춤
        splashColor: Colors.orange.withOpacity(0.3), // 클릭 시 나타나는 효과 색상
        highlightColor: Colors.orange.withOpacity(0.1), // 눌렸을 때 강조 효과
          child: Container(
            //해당 ui에 적용할 설정
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),

            //해당 ui에 적용하여 보여질 버튼, title 등 실제 ui
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 30), // 아이콘
                SizedBox(width: 10), // 간격
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(subTitle, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          )
        )
    );
  }
}*/

class ItemCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final VoidCallback? onTap;

  const ItemCard({Key? key, required this.title, required this.subTitle, this.onTap}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool _isPressed = false; // 클릭 여부 상태 관리

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        if (widget.onTap != null) widget.onTap!();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        alignment: Alignment.center,
        transform: _isPressed
            ? (Matrix4.identity()..scale(0.95)) // 눌렀을 때 크기 축소
            : Matrix4.identity(), // 원래 크기
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.orange.shade100 : Colors.white, // 눌렀을 때 색상 변경
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.star, color: Colors.orange, size: 30),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(widget.subTitle, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

