import 'package:flutter/material.dart';

class InputChildName extends StatelessWidget {
  final VoidCallback onDelete;
  final bool showIcon; // 아이콘 표시 여부

  const InputChildName({
    super.key,
    required this.onDelete,
    required this.showIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            // IconButton(
            //   icon: const Icon(
            //     Icons.do_not_disturb_on,
            //     color: Color.fromRGBO(30, 136, 229, 1),
            //   ),
            //   onPressed: onDelete,
            // ),
            if (showIcon) // showIcon이 true일 때만 아이콘 표시
              IconButton(
                icon: const Icon(
                  Icons.do_not_disturb_on,
                  color: Color.fromRGBO(30, 136, 229, 1),
                ),
                onPressed: onDelete,
              ),
          ],
        ),
      ),
    );
  }

  String getName() {
    // TextField에서 입력된 자녀 이름을 반환
    // 이 메서드를 통해 자녀 이름을 가져올 수 있습니다.
    // 예를 들어, TextField의 controller를 사용하여 입력된 값을 가져올 수 있습니다.
    // 여기서는 간단히 빈 문자열을 반환합니다.
    return '';
  }
}
