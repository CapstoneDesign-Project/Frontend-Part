import 'package:flutter/material.dart';

class InputChildSchool extends StatelessWidget {
  final VoidCallback onDelete;
  final bool showIcon;

  const InputChildSchool({
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
}
