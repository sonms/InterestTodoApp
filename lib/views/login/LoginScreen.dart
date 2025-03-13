
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

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

    if (type == LoginType.kakao) {
      _loginWithKakao();
    }
    // 여기에 로그인 로직 추가
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }

  Future<void> _loginWithKakao() async {
    try {
      bool isKakaoInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isKakaoInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      print('카카오 로그인 성공! 토큰: ${token.accessToken}');
      _getUserInfo(); // 로그인 성공 시 사용자 정보 가져오기
    } catch (error) {
      print('카카오 로그인 실패: $error');
    }
  }

  Future<void> _getUserInfo() async {
    try {
      User user = await UserApi.instance.me();
      print('사용자 정보: ${user.kakaoAccount?.email}, 닉네임: ${user.kakaoAccount?.profile?.nickname}');
    } catch (error) {
      print('사용자 정보 가져오기 실패: $error');
    }
  }

  Future<void> _loginWithKakaoTalk() async {
    try {
      await UserApi.instance.loginWithKakaoTalk();
      print("카카오톡 로그인 성공!");
    } catch (error) {
      print("카카오톡 로그인 실패, 계정 로그인 시도");
      _loginWithKakaoAccount();
    }
  }

  Future<void> _loginWithKakaoAccount() async {
    try {
      await UserApi.instance.loginWithKakaoAccount();
      print("카카오 계정 로그인 성공!");
    } catch (error) {
      print("카카오 계정 로그인 실패: $error");
    }
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