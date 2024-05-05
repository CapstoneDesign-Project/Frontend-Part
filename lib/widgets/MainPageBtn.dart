import 'package:flutter/material.dart';

class MainPageBtn extends StatelessWidget {
  final String text;
  final dynamic ic;

  const MainPageBtn({
    super.key,
    required this.text,
    required this.ic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 217, 217, 217),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 30),
        child: Column(
          children: [
            Icon(
              ic,
              size: 50,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
