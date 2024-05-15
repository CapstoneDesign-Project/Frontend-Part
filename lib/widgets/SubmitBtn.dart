import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:una/mainPage.dart';
import 'package:una/widgets/InputChildName.dart';
import 'package:una/widgets/InputChildSchool.dart';

class SubmitBtn extends StatelessWidget {
  final String text;
  final String go;

  const SubmitBtn({
    super.key,
    required this.text,
    required this.go,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go(go);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.64),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
