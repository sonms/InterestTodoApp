import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginService { // 비동기로 Oauth 연결 및 카카오톡 설치 여부 확인 / 유저 정보까지
  Future<OAuthToken?> login() async {
    try {
      bool isKakaoInstalled = await isKakaoTalkInstalled();
      OAuthToken token = isKakaoInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      print(' 카카오 로그인 성공! 토큰: ${token.accessToken}');
      return token;
    } catch (error) {
      print(' 카카오 로그인 실패 services: $error');
      return null;
    }
  }

  Future<User?> getUserInfo() async {
    try {
      User user = await UserApi.instance.me();
      print(' 사용자 정보: ${user.kakaoAccount?.email}, 닉네임: ${user.kakaoAccount?.profile?.nickname}');
      return user;
    } catch (error) {
      print(' 사용자 정보 가져오기 실패: $error');
      return null;
    }
  }
}