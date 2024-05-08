import 'package:flutter/material.dart';

class InputChildSchool extends StatelessWidget {
  const InputChildSchool({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
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
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.add_circle_rounded,
              color: Color.fromRGBO(30, 136, 229, 1),
            ),
          ],
        ),
      ),
    );
  }
}
