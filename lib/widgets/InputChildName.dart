import 'package:flutter/material.dart';

class InputChildName extends StatefulWidget {
  final VoidCallback? onDelete;
  final bool showIcon;

  const InputChildName({
    super.key,
    required this.onDelete,
    required this.showIcon,
  });

  @override
  State<InputChildName> createState() => _InputChildNameState();
}

class _InputChildNameState extends State<InputChildName> {
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
                  //hintText: '한소운',
                ),
                //ddd
                onChanged: (value) {
                  //
                },
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
