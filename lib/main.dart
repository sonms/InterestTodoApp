import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:interest_todo_app/views/account/AccountScreen.dart';
import 'package:interest_todo_app/views/home/HomeScreen.dart';
import 'package:interest_todo_app/views/login/LoginScreen.dart';
import 'package:interest_todo_app/views/saved/SavedScreen.dart';
import 'package:interest_todo_app/views/search/SearchScreen.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env"); // ✅ .env 파일 로드
  String kakaoApiKey = dotenv.env['KAKAO_API_KEY'] ?? '';
  String jsApiKey = dotenv.env['JAVASCRIPT_API_KEY'] ?? '';

  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: kakaoApiKey,
    javaScriptAppKey: jsApiKey,
  );
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interest Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

//_는 private
class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // 각 인덱스별 페이지
  final List<Widget> _pages = [
    HomeScreen(),
    SavedScreen(),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // 선택된 화면 표시\
      appBar: AppBar(
        title: Text('Interest Todo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),
        centerTitle: true,
        actions: [//actions 위젯 리스트 지정
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
              icon: Icon(Icons.search)),
          //IconButton(onPressed: () {}, icon: Icon(Icons.)),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: '저장',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My',
          ),
        ],
      ),
    );
  }
}

