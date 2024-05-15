import 'package:flutter/material.dart';
import 'package:una/widgets/BringReserveContents.dart';
import 'package:una/widgets/SubmitBtn.dart';

void main() {
  runApp(const ReserveDetail());
}

class ReserveDetail extends StatefulWidget {
  const ReserveDetail({super.key});

  @override
  State<ReserveDetail> createState() => _ReserveDetailState();
}

class _ReserveDetailState extends State<ReserveDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
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
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '자녀',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BringReserveContents(text: '한소운'),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '예약 일자',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BringReserveContents(text: '2024-05-04'),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '상담 유형',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BringReserveContents(text: '성적'),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '상담 내용',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BringReserveContents(text: '이번 학기 성적 관련으로 상담 요청합니다.'),
                SizedBox(
                  height: 20,
                ),
                // SubmitBtn(text: '예약 취소'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
