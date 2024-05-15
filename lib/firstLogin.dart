import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:una/UserController.dart';
import 'package:provider/provider.dart';
import 'package:una/userLogin.dart';

class FirstLogin extends StatefulWidget {
  static const routeName = "firstLogin";
  static const routeURL = "/";

  const FirstLogin({super.key});

  @override
  State<FirstLogin> createState() => _FirstLoginState();
}

class _FirstLoginState extends State<FirstLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'UNA',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w700,
              ),
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() => Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          //onTap: context.read<UserController>().kakaoLogin,
          onTap: () {
            GoRouter.of(context).go('/userLogin');
          },
          child: Image.asset(
            "asset/image/Kakao4.png",
            scale: 1.5,
          ),
        ),
      );
}
