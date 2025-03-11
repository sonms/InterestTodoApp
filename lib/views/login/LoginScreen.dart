
import 'package:flutter/material.dart';

import '../../main.dart';

enum LoginType { kakao, naver }


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginButtonGroup();
  }
}

class LoginButtonGroup extends StatefulWidget {
  final VoidCallback? onTap;

  const LoginButtonGroup({super.key, this.onTap});

  @override
  State<StatefulWidget> createState() {
    return _LoginButtonGroupState();
  }
}

class _LoginButtonGroupState extends State<LoginButtonGroup> {
  LoginType? selectedType;

  void _handleLogin(LoginType type) {
    setState(() {
      selectedType = type;
    });

    // 여기에 로그인 로직 추가
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Text("로그인", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
        DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold), child: Text("로그인")),

        _buildLoginButton(
          type: LoginType.kakao,
          imagePath: 'assets/images/kakao_login_medium_narrow.png'
        ),
        const SizedBox(height: 10),
        _buildLoginButton(
          type: LoginType.naver,
          imagePath: 'assets/images/btnG_완성형.png'
        ),
      ],
    );
  }

  /*Widget _buildLoginButton({required LoginType type, required String imagePath}) {
    return ElevatedButton(
      onPressed: () => _handleLogin(type),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        backgroundColor: Colors.white, // 버튼 배경색
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, width: 100, height: 25,), // 이미지 크기 조절
          const SizedBox(width: 10),
          *//*Text(
            type == LoginType.kakao ? "카카오 로그인" : "네이버 로그인",
            style: const TextStyle(color: Colors.black),
          ),*//*
        ],
      ),
    );
  }*/
  Widget _buildLoginButton({required LoginType type, required String imagePath}) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () => _handleLogin(type),
        child: SizedBox(
          width: 150,
          height: 50,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}