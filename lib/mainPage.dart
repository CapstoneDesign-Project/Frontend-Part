import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:una/main.dart';
import 'package:una/noticePage.dart';
import 'package:una/parentsMyPage.dart';
import 'package:una/reserve.dart';
import 'package:una/widgets/MainPageBtn.dart';
import 'package:una/widgets/TypeChildContainer.dart';

// void main() => runApp(const MaterialApp(
//       home: MainPage(),
//     ));

// void main() {
//   runApp(const MainPage());
// }

class MainPage extends StatefulWidget {
  static const routeName = "mainPage";
  static const routeURL = "/mainPage";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NoticePage()));
            },
          ),
        ],
      ),
      body: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '공지',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 217, 217, 217),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2024년 4월 1일 월요일 오후 5:00',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                TypeChildContainer(text: '유형'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '성적',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                TypeChildContainer(text: '자녀'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '한소운 1학년 6반',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                MainPageBtn(
                                    text: '통화녹음',
                                    ic: Icons.phone_android_rounded,
                                    movePage: Reserve()),
                                SizedBox(
                                  height: 10,
                                ),
                                MainPageBtn(
                                    text: '상담챗봇',
                                    ic: Icons.support_agent_rounded,
                                    movePage: Reserve()),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                MainPageBtn(
                                    text: '학사일정',
                                    ic: Icons.calendar_month_rounded,
                                    movePage: Reserve()),
                                SizedBox(
                                  height: 10,
                                ),
                                MainPageBtn(
                                    text: '상담예약',
                                    ic: Icons.checklist_rounded,
                                    movePage: Reserve()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const ParentsMyPage(),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            if (index == 0) {
              // 학부모Main페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            } else if (index == 1) {
              // 학부모My페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ParentsMyPage()),
              );
            }
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: '홈',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_rounded),
            label: '마이페이지',
          )
        ],
      ),
      // bottomNavigationBar: NavigationBar(
      //   onDestinationSelected: (int index) {
      //     setState(() {
      //       currentPageIndex = index;
      //     });
      //   },
      //   selectedIndex: currentPageIndex,
      //   destinations: const <Widget>[
      //     NavigationDestination(
      //       icon: Icon(Icons.home_rounded),
      //       label: '홈',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.person_rounded),
      //       label: '마이페이지',
      //     )
      //   ],
      // ),
    );
  }
}
