import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:una/widgets/ParentsMyPageBtn.dart';

void main() {
  runApp(const ParentsMyPage());
}

class ParentsMyPage extends StatefulWidget {
  const ParentsMyPage({super.key});

  @override
  State<ParentsMyPage> createState() => _ParentsMyPageState();
}

class _ParentsMyPageState extends State<ParentsMyPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'UNA',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 217, 217, 217),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications_rounded,
                size: 27,
              ),
              onPressed: () {
                print('알림버튼 클릭');
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: '마이페이지',
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 234, 233, 233),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      color: Color.fromARGB(255, 168, 168, 168),
                      size: 65,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    '학부모1님',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 110,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 217, 217, 217),
                      width: 1.7,
                    ),
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 217, 217, 217),
                      width: 1.7,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '자녀정보 수정',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                ),
              ),
              const ParentsMyPageBtn(
                  text: '고객센터', ic: Icons.arrow_forward_ios_rounded),
              const ParentsMyPageBtn(
                  text: '개인정보 처리방침', ic: Icons.arrow_forward_ios_rounded),
              const ParentsMyPageBtn(
                  text: '로그아웃', ic: Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
