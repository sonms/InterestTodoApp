import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import '../services/Kakao_Login_Services.dart';

class UserController with ChangeNotifier {
  final KakaoLoginService _kakaoLoginService = KakaoLoginService();
  User? _user;

  User? get user => _user;

  Future<void> loginWithKakao() async {
    OAuthToken? token = await _kakaoLoginService.login();
    if (token != null) {
      _user = await _kakaoLoginService.getUserInfo();
      notifyListeners(); // UI 업데이트
    }
  }
}