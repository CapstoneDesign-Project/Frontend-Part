import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:una/teacherLogin.dart';
import 'package:una/userLogin.dart';

class AppPurpose extends StatefulWidget {
  static const routeName = "purpose";
  static const routeURL = "/purpose";

  const AppPurpose({super.key});

  @override
  State<AppPurpose> createState() => _AppPurposeState();
}

class _AppPurposeState extends State<AppPurpose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '앱 사용 목적을',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '선택해주세요.',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 140,
            ),
            GestureDetector(
              onTap: () async {
                GoRouter.of(context).go(TeacherLogin.routeURL);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 217, 217, 217),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 17, horizontal: 90),
                  child: Column(
                    children: [
                      Text(
                        '교사용',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                GoRouter.of(context).go(UserLogin.routeURL);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 217, 217, 217),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 75),
                  child: Column(
                    children: [
                      Text(
                        '학부모용',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
