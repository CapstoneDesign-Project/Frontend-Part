import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParentsMyPageBtn extends StatelessWidget {
  final String text;
  final dynamic ic;

  const ParentsMyPageBtn({
    super.key,
    required this.text,
    required this.ic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          // top: BorderSide(
          //   color: Color.fromARGB(255, 217, 217, 217),
          //   width: 1.7,
          // ),
          bottom: BorderSide(
            color: Color.fromARGB(255, 217, 217, 217),
            width: 1.7,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Icon(ic),
          ],
        ),
      ),
    );
  }
}
