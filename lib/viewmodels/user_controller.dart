import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:interest_todo_app/services/kakao_login_services.dart'; // KakaoLoginService import

class UserController with ChangeNotifier {
  final KakaoLoginService _kakaoLoginService = KakaoLoginService();
  User? _user;

  User? get user => _user;

  Future<void> loginWithKakao() async {
    OAuthToken? token = await _kakaoLoginService.login();
    if (token != null) {
      _user = await _kakaoLoginService.getUserInfo();
      notifyListeners(); // UI 업데이트
    } else {
      // 로그인 실패 시 처리할 로직
      print('카카오 로그인 실패 user');
    }
  }
}