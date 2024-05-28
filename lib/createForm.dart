import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:una/noticePage.dart';
import 'package:una/reserve.dart';
import 'package:una/widgets/ReserveDate.dart';
import 'package:una/widgets/SubmitBtn.dart';

class CreateForm extends StatefulWidget {
  static const routeName = "createForm";
  static const routeURL = "/createForm";

  const CreateForm({super.key});

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  String initChild = "";
  String initCounsel = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          // onPressed: () {
          //   GoRouter.of(context).go('/reserve');
          // },
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Reserve()),
            );
          },
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NoticePage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '자녀',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _childChoose(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '상담 유형',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _counselChoose(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '예약 일자',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              // 달력으로 선택
              const ReserveDate(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '상담 내용',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),

              // 상담 내용 입력 필드
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //const SubmitBtn(text: '예약 완료'),
            ],
          ),
        ),
      ),
    );
  }

  // 자녀 선택
  Widget _childChoose() {
    List<String> dropDownList = ['자녀1', '자녀2', '자녀3'];

    if (initChild == "") {
      initChild = dropDownList.first;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(120, 28, 26, 28)),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 50),
        child: DropdownButton(
          value: initChild,
          items: dropDownList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              initChild = value!;
              print(initChild);
            });
          },
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          underline: Container(),
        ),
      ),
    );
  }

  // 상담 유형 선택
  Widget _counselChoose() {
    List<String> dropDownList = ['성적', '진학', '진로', '학급생활', '교우관계', '기타'];

    if (initCounsel == "") {
      initCounsel = dropDownList.first;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(120, 28, 26, 28)),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 50),
        child: DropdownButton(
          value: initCounsel,
          items: dropDownList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              initCounsel = value!;
              print(initCounsel);
            });
          },
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          underline: Container(),
        ),
      ),
    );
  }

  // 예약 일자
}
