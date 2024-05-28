import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:una/appPurpose.dart';
import 'package:una/parentInfoForm.dart';

class TeacherLogin extends StatelessWidget {
  static const routeName = "teacherLogin";
  static const routeURL = "/teacherLogin";

  const TeacherLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WebViewWidget(),
      ),
    );
  }
}

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({super.key});

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri.uri(Uri.parse(
            'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=18ebd7a59d41c432a2100326647ce985&redirect_uri=http://ec2-3-36-85-32.ap-northeast-2.compute.amazonaws.com:8080/kakao/callback')),
      ),
      onWebViewCreated: (controller) {
        _webViewController = controller;
      },
      onLoadStop: (controller, url) async {
        String? responseBody =
            await _webViewController.evaluateJavascript(source: '''
          (function() {
            try {
              return document.body.textContent;
            } catch (e) {
              return null;
            }
          })();
        ''');

        if (responseBody != null) {
          try {
            Map<String, dynamic> responseJson = jsonDecode(responseBody);
            if (responseJson['id'] == 'Success') {
              // 아래 코드 교사용 회원기입 페이지로 이동할 수 있게 수정할 것
              context.go(
                '/parentInfo',
                extra: responseJson['result'],
              );
            }
          } catch (e) {
            print("Error parsing JSON: $e");
          }
        }
      },
    );
  }
}
