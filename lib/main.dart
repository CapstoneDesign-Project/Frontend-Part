import 'package:flutter/material.dart';
import 'package:una/appPurpose.dart';
import 'package:una/login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:una/loginTest.dart';
import 'package:una/mainPage.dart';

void main() => runApp(const App());
//KakaoSdk.init(nativeAppKey: '82efe4abd89c7464f5ad4c7aa73b806c');

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppPurpose(),
      //home: MainPage(),
    );
  }
}
