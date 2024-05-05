import 'package:flutter/material.dart';
import 'package:una/widgets/InputChildGradeclass.dart';
import 'package:una/widgets/InputChildNameSchool.dart';
import 'package:una/widgets/SubmitBtn.dart';

void main() {
  runApp(const ChildInfoUpdate());
}

class ChildInfoUpdate extends StatefulWidget {
  const ChildInfoUpdate({super.key});

  @override
  State<ChildInfoUpdate> createState() => _ChildInfoUpdateState();
}

class _ChildInfoUpdateState extends State<ChildInfoUpdate> {
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
                  '자녀1 이름',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                InputChildNameSchool(),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '자녀1 학교',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                InputChildNameSchool(),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '자녀1 학년 및 반',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InputChildGradeclass(),
                SizedBox(
                  height: 20,
                ),
                SubmitBtn(text: '수정'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
