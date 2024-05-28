import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:una/noticePage.dart';
import 'package:una/parentsMyPage.dart';
import 'package:una/widgets/SubmitBtn.dart';

class ChildInfoUpdate extends StatefulWidget {
  final String parentKakaoId;
  final String childName;

  const ChildInfoUpdate({
    super.key,
    required this.parentKakaoId,
    required this.childName,
  });

  @override
  _ChildInfoUpdateState createState() => _ChildInfoUpdateState();
}

class _ChildInfoUpdateState extends State<ChildInfoUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _childSchoolController = TextEditingController();
  final _childGradeController = TextEditingController();
  final _childClassController = TextEditingController();
  final _childNumberController = TextEditingController();
  final _childNameController = TextEditingController();

  Future<void> _updateChildInfo() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> childInfo = {
        "childSchool": _childSchoolController.text,
        "childGrade": int.parse(_childGradeController.text),
        "childClass": int.parse(_childClassController.text),
        "childNumber": int.parse(_childNumberController.text),
        "childName": _childNameController.text,
      };

      try {
        final response = await http.put(
          Uri.parse(
              'http://ec2-3-36-85-32.ap-northeast-2.compute.amazonaws.com:8080/user/update-child/${widget.parentKakaoId}/${widget.childName}'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(childInfo),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('수정되었습니다.'),
          ));
          GoRouter.of(context).go('/parentsMyPage');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('정보 업데이트 실패: ${response.statusCode}'),
          ));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('오류 발생: $e'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          // onPressed: () {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => const ParentsMyPage()));
          // },
          onPressed: () {
            GoRouter.of(context).go('/parentsMyPage');
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _childNameController,
                decoration: const InputDecoration(
                  labelText: '자녀 이름',
                  labelStyle: TextStyle(
                    fontSize: 17,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '필수 입력 항목입니다';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _childSchoolController,
                decoration: const InputDecoration(
                  labelText: '자녀 학교',
                  labelStyle: TextStyle(
                    fontSize: 17,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '필수 입력 항목입니다';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _childGradeController,
                decoration: const InputDecoration(
                  labelText: '자녀 학년',
                  labelStyle: TextStyle(
                    fontSize: 17,
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '필수 입력 항목입니다';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _childClassController,
                decoration: const InputDecoration(
                  labelText: '자녀 반',
                  labelStyle: TextStyle(
                    fontSize: 17,
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '필수 입력 항목입니다';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _childNumberController,
                decoration: const InputDecoration(
                  labelText: '자녀 번호',
                  labelStyle: TextStyle(
                    fontSize: 17,
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '필수 입력 항목입니다';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SubmitBtn(
                text: '수정',
                onPressed: _updateChildInfo,
                isButtonEnabled: true,
              ),
              // ElevatedButton(
              //   onPressed: _updateChildInfo,
              //   child: const Text('업데이트'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
