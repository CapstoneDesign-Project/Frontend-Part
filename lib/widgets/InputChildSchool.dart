import 'package:flutter/material.dart';

class InputChildSchool extends StatefulWidget {
  final VoidCallback? onDelete;
  final bool showIcon;

  const InputChildSchool({
    super.key,
    required this.onDelete,
    required this.showIcon,
  });

  @override
  State<InputChildSchool> createState() => _InputChildSchoolState();
}

class _InputChildSchoolState extends State<InputChildSchool> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  //hintText: 'ㅇㅇ초등학교',
                ),
                //ddd
                onChanged: (value) {
                  // You need to add logic here to update the relevant child info in MemInfo
                },
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            if (widget.showIcon) // showIcon이 true일 때만 아이콘 표시
              IconButton(
                icon: const Icon(
                  Icons.do_not_disturb_on,
                  color: Color.fromRGBO(30, 136, 229, 1),
                ),
                onPressed: widget.onDelete,
              ),
          ],
        ),
      ),
    );
  }
}
