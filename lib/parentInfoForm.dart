import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:una/mainPage.dart';
import 'package:una/widgets/ParentsID.dart';
import 'package:una/widgets/ParentsName.dart';
import 'package:una/widgets/ParentsPhone.dart';
import 'package:una/widgets/SubmitBtn.dart';

class ParentInfoForm extends StatefulWidget {
  static const routeName = "parentInfo";
  static const routeURL = "/parentInfo";

  final Map<String, dynamic> parentInfo;

  const ParentInfoForm({required this.parentInfo, super.key});

  @override
  _ParentInfoFormState createState() => _ParentInfoFormState();
}

class _ParentInfoFormState extends State<ParentInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, TextEditingController>> _childrenControllers = [];

  void _addChild() {
    setState(() {
      _childrenControllers.add({
        "childName": TextEditingController(),
        "childSchool": TextEditingController(),
        "childGrade": TextEditingController(),
        "childClass": TextEditingController(),
        "childNumber": TextEditingController(),
      });
    });
  }

  void _removeChild(int index) {
    setState(() {
      _childrenControllers.removeAt(index);
    });
  }

  Future<void> _saveParentInfo() async {
    if (_formKey.currentState!.validate()) {
      List<Map<String, dynamic>> children = _childrenControllers.map((child) {
        return {
          "childName": child["childName"]!.text,
          "childSchool": child["childSchool"]!.text,
          "childGrade": int.parse(child["childGrade"]!.text),
          "childClass": int.parse(child["childClass"]!.text),
          "childNumber": int.parse(child["childNumber"]!.text),
        };
      }).toList();

      Map<String, dynamic> parentInfo = {
        "parentEmail": widget.parentInfo['email'],
        "parentName": widget.parentInfo['name'],
        "parentPhoneNumber": widget.parentInfo['phone_number'],
        "parentKakaoId": widget.parentInfo['id'],
        "children": children,
      };

      try {
        final response = await http.post(
          Uri.parse(
              'http://ec2-3-36-85-32.ap-northeast-2.compute.amazonaws.com:8080/user/save-parent'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(parentInfo),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('가입이 완료되었습니다.'),
          ));
          GoRouter.of(context).go(MainPage.routeURL);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Failed to save parent info: ${response.statusCode}'),
          ));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: $e'),
        ));
      }
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const Text(
                '아이디',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ParentsID(userId: '${widget.parentInfo['email']}'),
              const Text(
                '내 이름',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ParentsName(userName: '${widget.parentInfo['name']}'),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '휴대폰',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ParentsPhone(userPhone: '${widget.parentInfo['phone_number']}'),
              // Text('Parent Name: ${widget.parentInfo['name']}'),
              // Text('Parent Phone Number: ${widget.parentInfo['phone_number']}'),
              // Text('Parent Kakao ID: ${widget.parentInfo['id']}'),
              const SizedBox(height: 20),
              ..._childrenControllers.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, TextEditingController> child = entry.value;
                return Card(
                  key: ValueKey(index),
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: child["childName"]!,
                          decoration: const InputDecoration(
                            labelText: '자녀 이름',
                            labelStyle: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '필수 입력 항목입니다.';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: child["childSchool"]!,
                          decoration: const InputDecoration(
                            labelText: '자녀 학교',
                            labelStyle: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '필수 입력 항목입니다.';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: child["childGrade"]!,
                          decoration: const InputDecoration(
                            labelText: '자녀 학년',
                            labelStyle: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '필수 입력 항목입니다.';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: child["childClass"]!,
                          decoration: const InputDecoration(
                            labelText: '자녀 반',
                            labelStyle: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '필수 입력 항목입니다.';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: child["childNumber"]!,
                          decoration: const InputDecoration(
                            labelText: '자녀 번호',
                            labelStyle: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '필수 입력 항목입니다.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () => _removeChild(index),
                          child: const Text(
                            'DELETE',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              TextButton(
                onPressed: _addChild,
                child: const Text(
                  'ADD',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SubmitBtn(
                text: '완료',
                //go: '/mainPage',
                onPressed: _saveParentInfo,
                isButtonEnabled: true,
              ),
              // ElevatedButton(
              //   onPressed: _saveParentInfo,
              //   child: const Text('Save Parent Info'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
