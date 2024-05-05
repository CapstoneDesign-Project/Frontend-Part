import 'package:flutter/material.dart';
import 'package:una/login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:una/loginTest.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '82efe4abd89c7464f5ad4c7aa73b806c');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginTest(),
    );
  }
}
