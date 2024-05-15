import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:una/router.dart';
import 'package:una/widgets/ParentsID.dart';
import 'package:una/widgets/ParentsName.dart';
import 'package:una/widgets/InputChildGradeclass.dart';
import 'package:una/widgets/InputChildName.dart';
import 'package:una/widgets/InputChildSchool.dart';
import 'package:una/widgets/ParentsPhone.dart';
import 'package:una/widgets/SubmitBtn.dart';
import 'package:http/http.dart' as http;

class MemInfo extends StatefulWidget {
  static const routeName = "memInfo";
  static const routeURL = "/";

  const MemInfo({super.key});

  @override
  State<MemInfo> createState() => _MemInfoState();
}

class _MemInfoState extends State<MemInfo> {
  bool showChildNameInputField = false;
  bool showChildShcoolInputField = false;
  bool showGradeClassField = false;

  List<Widget> childNameInputWidgets = [];
  List<Widget> childShcoolInputWidgets = [];
  List<Widget> gradeClassFieldWidgets = [];

  String gradeValue = "1";
  String classValue = "1";

  int childNameCount = 0;
  int schoolCount = 0;
  int gradeClassCount = 0;

  bool isChildNameEntered = false;
  bool isChildSchoolEntered = false;

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = isChildNameEntered && isChildSchoolEntered;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '아이디',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ParentsID(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '내 이름',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ParentsName(),
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
              const ParentsPhone(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '자녀 이름',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 70,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          //추
                          onChanged: (value) {
                            setState(() {
                              isChildNameEntered = value.isNotEmpty;
                            });
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle_rounded,
                          color: Color.fromRGBO(30, 136, 229, 1),
                        ),
                        onPressed: () {
                          setState(() {
                            childNameCount++;
                            if (childNameCount == 1) {
                              // 두 번째 이후의 위젯일 때 아이콘 표시
                              childNameInputWidgets.add(
                                InputChildName(
                                  onDelete: () {
                                    setState(() {
                                      childNameCount--;
                                      childNameInputWidgets.removeLast();
                                    });
                                  },
                                  showIcon: true, // 아이콘 표시 여부
                                ),
                              );
                            } else {
                              childNameInputWidgets.add(
                                InputChildName(
                                  onDelete: () {
                                    setState(() {
                                      childNameCount--;
                                      childNameInputWidgets.removeLast();
                                    });
                                  },
                                  showIcon: false, // 아이콘 표시하지 않음
                                ),
                              );
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ...childNameInputWidgets,
              const SizedBox(
                height: 5,
              ),
              const Text(
                '자녀 학교',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 70,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          onChanged: (value) {
                            setState(() {
                              isChildSchoolEntered = value.isNotEmpty;
                            });
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle_rounded,
                          color: Color.fromRGBO(30, 136, 229, 1),
                        ),
                        onPressed: () {
                          setState(() {
                            schoolCount++;
                            if (schoolCount == 1) {
                              childShcoolInputWidgets.add(
                                InputChildSchool(
                                  onDelete: () {
                                    setState(() {
                                      schoolCount--;
                                      childShcoolInputWidgets.removeLast();
                                    });
                                  },
                                  showIcon: true,
                                ),
                              );

                              // showChildShcoolInputField =
                              //     !showChildShcoolInputField;
                            } else {
                              childShcoolInputWidgets.add(
                                InputChildSchool(
                                  onDelete: () {
                                    setState(() {
                                      schoolCount--;
                                      childShcoolInputWidgets.removeLast();
                                    });
                                  },
                                  showIcon: false, // 아이콘 표시하지 않음
                                ),
                              );
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //const InputChildSchool(),
              ...childShcoolInputWidgets,
              const SizedBox(
                height: 5,
              ),
              const Text(
                '자녀 학년 및 반',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _buildAreaGrade(),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '학년',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  _buildAreaClass(),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '반',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      color: Color.fromRGBO(30, 136, 229, 1),
                    ),
                    onPressed: () {
                      setState(() {
                        gradeClassCount++;
                        if (gradeClassCount == 1) {
                          gradeClassFieldWidgets.add(
                            InputChildGradeclass(
                              onDelete: () {
                                setState(() {
                                  gradeClassCount--;
                                  gradeClassFieldWidgets.removeLast();
                                });
                              },
                              showIcon: true,
                            ),
                          );
                        } else {
                          gradeClassFieldWidgets.add(
                            InputChildGradeclass(
                              onDelete: () {
                                setState(() {
                                  gradeClassCount--;
                                  gradeClassFieldWidgets.removeLast();
                                });
                              },
                              showIcon: false, // 아이콘 표시하지 않음
                            ),
                          );
                        }
                        //showGradeClassField = !showGradeClassField;
                      });
                    },
                  ),
                ],
              ),
              ...gradeClassFieldWidgets,
              //const InputChildGradeclass(),
              const SizedBox(
                height: 20,
              ),
              SubmitBtn(
                text: '완료',
                go: isButtonEnabled ? '/mainPage' : '/',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAreaGrade() {
    // 드롭다운 리스트
    List<String> dropDownListGrade = ['1', '2', '3', '4', '5', '6'];

    // 초기값 설정
    if (gradeValue == "") {
      gradeValue = dropDownListGrade.first;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(120, 28, 26, 28)), // 외곽선 색상 설정
        borderRadius: BorderRadius.circular(12.0), // 외곽선의 모서리를 둥글게 설정
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
        child: DropdownButton(
          // 드롭다운 버튼에 처음 보여질 값
          value: gradeValue,
          // 드롭다운의 리스트를 보여줄 값
          items:
              dropDownListGrade.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 20),
              ),
            );
          }).toList(),
          // 드롭다운의 값을 선택했을 경우
          onChanged: (String? value) {
            setState(() {
              gradeValue = value!;
              print('$gradeValue학년');
            });
          },
          // 드롭다운 버튼의 스타일 설정
          icon: const Icon(Icons.arrow_drop_down), // 드롭다운 버튼 아이콘 설정
          iconSize: 24, // 드롭다운 버튼 아이콘 크기 설정
          underline: Container(), // 드롭다운 버튼 아래의 선 제거
        ),
      ),
    );
  }

  Widget _buildAreaClass() {
    // 드롭다운 리스트
    List<String> dropDownListClass = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10'
    ];

    // 초기값 설정
    if (classValue == "") {
      classValue = dropDownListClass.first;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(120, 28, 26, 28)), // 외곽선 색상 설정
        borderRadius: BorderRadius.circular(12.0), // 외곽선의 모서리를 둥글게 설정
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
        child: DropdownButton(
          // 드롭다운 버튼에 처음 보여질 값
          value: classValue,
          // 드롭다운의 리스트를 보여줄 값
          items:
              dropDownListClass.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 20),
              ),
            );
          }).toList(),
          // 드롭다운의 값을 선택했을 경우
          onChanged: (String? value) {
            setState(() {
              classValue = value!;
              print('$classValue반');
            });
          },
          // 드롭다운 버튼의 스타일 설정
          icon: const Icon(Icons.arrow_drop_down), // 드롭다운 버튼 아이콘 설정
          iconSize: 24, // 드롭다운 버튼 아이콘 크기 설정
          underline: Container(), // 드롭다운 버튼 아래의 선 제거
        ),
      ),
    );
  }
}
