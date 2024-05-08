import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:una/widgets/Bringmemfield.dart';
import 'package:una/widgets/InputChildGradeclass.dart';
import 'package:una/widgets/InputChildName.dart';
import 'package:una/widgets/InputChildSchool.dart';
import 'package:una/widgets/SubmitBtn.dart';

// void main() {
//   runApp(const MemInfo());
// }

class MemInfo extends StatefulWidget {
  const MemInfo({super.key});

  @override
  State<MemInfo> createState() => _MemInfoState();
}

class _MemInfoState extends State<MemInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '아이디',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BringMemField(text: 'appl68'),
              SizedBox(
                height: 15,
              ),
              Text(
                '내 이름',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BringMemField(text: '김땡땡'),
              SizedBox(
                height: 15,
              ),
              Text(
                '휴대폰',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BringMemField(text: '010-1234-5678'),
              SizedBox(
                height: 15,
              ),
              Text(
                '자녀1 이름',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.add_circle_rounded,
                      //     color: Color.fromRGBO(30, 136, 229, 1),
                      //   ),
                      //   onPressed: () {
                      //     // print('plus button clicked');
                      //   },
                      // ),
                      // Icon(
                      //   Icons.add_circle_rounded,
                      //   color: Color.fromRGBO(30, 136, 229, 1),
                      // ),
                    ],
                  ),
                ),
              ),
              //InputChildName(),
              SizedBox(
                height: 5,
              ),
              Text(
                '자녀1 학교',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              InputChildSchool(),
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
              SubmitBtn(text: '완료'),
            ],
          ),
        ),
      ),
    );
  }
}
