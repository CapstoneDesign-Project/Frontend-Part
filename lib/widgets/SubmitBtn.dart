import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:una/mainPage.dart';
import 'package:una/widgets/InputChildName.dart';
import 'package:una/widgets/InputChildSchool.dart';

class SubmitBtn extends StatelessWidget {
  final String text;
  final bool isButtonEnabled;
  final VoidCallback onPressed;

  const SubmitBtn({
    super.key,
    required this.text,
    required this.isButtonEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isButtonEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isButtonEnabled
            ? const Color.fromRGBO(0, 0, 0, 0.64)
            : const Color.fromRGBO(189, 189, 189, 1),
        minimumSize: const Size.fromHeight(40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
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
    );
  }
}
