import 'package:flutter/material.dart';

class InputChildNameSchool extends StatelessWidget {
  const InputChildNameSchool({super.key});

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
            Icon(
              Icons.add_circle_rounded,
              color: Colors.blue[600],
            ),
          ],
        ),
      ),
    );
  }
}
