import 'package:flutter/material.dart';

class InputChildGradeclass extends StatefulWidget {
  const InputChildGradeclass({super.key});

  @override
  State<InputChildGradeclass> createState() => _InputChildGradeclassState();
}

class _InputChildGradeclassState extends State<InputChildGradeclass> {
  // 드롭다운 버튼의 선택된 값을 저장할 변수
  String gradeValue = "1";
  String classValue = "1";

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
            Icon(
              Icons.add_circle_rounded,
              color: Colors.blue[600],
            ),
          ],
        ),
      ],
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
