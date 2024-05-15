// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:http/http.dart' as http;
// import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
// import 'package:una/login_platform.dart';

// class UserLogin extends StatefulWidget {
//   static const routeName = "userLogin";
//   static const routeURL = "/";

//   const UserLogin({super.key});

//   @override
//   State<UserLogin> createState() => _UserLoginState();
// }

// class _UserLoginState extends State<UserLogin> {
//   LoginPlatform _loginPlatform = LoginPlatform.none;
//   late InAppWebViewController _webViewController;

//   void signInWithKakao() async {
//     try {
//       bool isInstalled = await isKakaoTalkInstalled();

//       OAuthToken token = isInstalled
//           ? await UserApi.instance.loginWithKakaoTalk()
//           : await UserApi.instance.loginWithKakaoAccount();

//      final url = Uri.parse('http://localhost:8080/login');

//       final response = await http.get(
//         url,
//         headers: {
//           HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
//         },
//       );

//       final profileInfo = json.decode(response.body);
//       print(profileInfo.toString());

//       setState(() {
//         _loginPlatform = LoginPlatform.kakao;
//       });
//     } catch (error) {
//       print('카카오톡으로 로그인 실패 $error');
//     }
//   }

//   void signOut() async {
//     switch (_loginPlatform) {
//       // case LoginPlatform.google:
//       //   break;
//       case LoginPlatform.kakao:
//         await UserApi.instance.logout();
//         break;
//       //  case LoginPlatform.naver:
//       //   break;
//       case LoginPlatform.none:
//         break;
//     }

//     setState(() {
//       _loginPlatform = LoginPlatform.none;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(40),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 140,
//             ),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'UNA',
//                   style: TextStyle(
//                     fontSize: 80,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 110,
//             ),
//             _loginPlatform != LoginPlatform.none
//                 ? _logoutButton()
//                 : Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _loginButton(
//                         'Kakao4',
//                         signInWithKakao,
//                       )
//                     ],
//                   ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _loginButton(String path, VoidCallback onTap) {
//     return Card(
//       clipBehavior: Clip.antiAlias,
//       child: Ink.image(
//         image: AssetImage('asset/image/$path.png'),
//         fit: BoxFit.fill,
//         width: 195,
//         height: 50,
//         child: InkWell(
//           onTap: onTap,
//         ),
//       ),
//     );
//   }

//   Widget _logoutButton() {
//     return ElevatedButton(
//       onPressed: signOut,
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(
//           const Color(0xff0165E1),
//         ),
//       ),
//       child: const Text('로그아웃'),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:una/firstLogin.dart';

enum LoginPlatform { none, kakao }

class UserLogin extends StatefulWidget {
  static const routeName = "userLogin";
  static const routeURL = "/userLogin";

  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  LoginPlatform _loginPlatform = LoginPlatform.none;
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                  url: Uri.parse(
                      'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=18ebd7a59d41c432a2100326647ce985&redirect_uri=http://localhost:8080/kakao/callback')),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onLoadStop: (controller, url) async {
                if (url.toString().startsWith('https://unatest.com/oauth')) {
                  // Kakao 인증 완료 시 처리할 로직
                  String code =
                      Uri.parse(url.toString()).queryParameters['code']!;
                  await _handleKakaoAuth(code);
                }
              },
            ),
          ),
          if (_loginPlatform != LoginPlatform.none) const Text(''),
          // ElevatedButton(
          //   onPressed: _signOut,
          //   child: const Text('로그아웃'),
          // ),
        ],
      ),
    );
  }

  Future<void> _handleKakaoAuth(String code) async {
    try {
      final response = await http.post(
        Uri.parse('https://kauth.kakao.com/oauth/token'),
        body: {
          'grant_type': 'authorization_code',
          'client_id': '18ebd7a59d41c432a2100326647ce985',
          //'redirect_uri': 'https://unatest.com/oauth',
          'redirect_uri': 'http://localhost:8080/kakao/callback',
          'code': code,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final accessToken = data['access_token'];

        // Kakao 로그인 성공 시 처리할 로직
        GoRouter.of(context).go('/purpose');
        // setState(() {
        //   _loginPlatform = LoginPlatform.kakao;
        // });
      } else {
        throw Exception('Failed to get access token');
      }
    } catch (error) {
      print('Kakao 로그인 실패: $error');
    }
  }

  void _signOut() {
    // 로그아웃 처리 로직
    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }
}
