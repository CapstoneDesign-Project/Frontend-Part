import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:una/KakaoLoginApi.dart';
import 'package:una/UserController.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:una/mainPage.dart';
import 'package:una/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(
    nativeAppKey: '82efe4abd89c7464f5ad4c7aa73b806c',
    javaScriptAppKey: '6e61253e80e5c084687d80974ac2a7d2',
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserController(
        kakaoLoginApi: KakaoLoginApi(),
      ),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
    // return MaterialApp.router(
    //   routerConfig: router,
    // );
  }
}

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: router,
//     );
//   }
// }
