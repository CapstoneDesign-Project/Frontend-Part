import 'package:flutter/material.dart';
import 'package:una/mainPage.dart';
import 'package:una/parentsMyPage.dart';

// void main() {
//   runApp(const NoticePage());
// }

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '알림',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: ListTile(
                  //leading: Icon(Icons.notifications_sharp),
                  title: Text('6월 26일 오후12:30'),
                  subtitle: Text('000 학생의 선생님이 상담 예약을 수락하였습니다.'),
                ),
              ),
            ],
          ),
        ),
      ),
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

      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(20),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         const Row(
      //           children: [
      //             SizedBox(
      //               width: 30,
      //             ),
      //             Text(
      //               '알림',
      //               style: TextStyle(
      //                 fontSize: 17,
      //               ),
      //             ),
      //           ],
      //         ),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Container(
      //               decoration: BoxDecoration(
      //                 color: const Color.fromARGB(255, 217, 217, 217),
      //                 borderRadius: BorderRadius.circular(12),
      //               ),
      //               child: const Padding(
      //                 padding:
      //                     EdgeInsets.symmetric(vertical: 13, horizontal: 65),
      //                 child: Text(
      //                   '06.26 12:30\n000 학생의 선생님이\n상담 예약을 수락하였습니다.',
      //                   style: TextStyle(fontSize: 15),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
