import 'package:flutter/material.dart';

class LoginBtn extends StatelessWidget {
  final String text;
  final Color txtColor;
  final Color boxColor;
  final String img;
  final double logoSize;

  // final dynamic ic;

  const LoginBtn({
    super.key,
    required this.text,
    required this.txtColor,
    required this.boxColor,
    required this.img,
    required this.logoSize,
    //   required this.ic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              scale: logoSize,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 25,
                color: txtColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
