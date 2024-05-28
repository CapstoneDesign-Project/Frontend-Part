import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:una/createForm.dart';
import 'package:una/mainPage.dart';
import 'package:una/noticePage.dart';
import 'package:una/parentsMyPage.dart';
import 'package:una/widgets/ReserveContainer.dart';

class Reserve extends StatefulWidget {
  static const routeName = "reserve";
  static const routeURL = "/reserve";

  const Reserve({super.key});

  @override
  State<Reserve> createState() => _ReserveState();
}

class _ReserveState extends State<Reserve> {
  int currentPageIndex = 0;

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NoticePage()));
              },
            ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home_rounded),
        //       label: '홈',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person_rounded),
        //       label: '마이페이지',
        //     ),
        //   ],
        // ),
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
                  MaterialPageRoute(
                      builder: (context) => const ParentsMyPage()),
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    // 기본
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 217, 217, 217),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 70, horizontal: 122),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('예약 내역 없음'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // 추가됐을 때
                    // const ReserveContainer(
                    //     datetimeTxt: '2024년 4월 1일 월요일 오후 5:00',
                    //     typeTxt: '성적',
                    //     childName: '한소운 1학년 6반'),
                    // const SizedBox(
                    //   height: 18,
                    // ),

                    const SizedBox(
                      height: 500,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 32,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateForm()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 0.64),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Text(
                      '예약하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
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
