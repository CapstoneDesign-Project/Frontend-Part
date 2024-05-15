import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:una/UserController.dart';

class ParentsID extends StatelessWidget {
  const ParentsID({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 217, 217, 217),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Consumer<UserController>(
          builder: (context, controller, child) {
            final String? userID =
                controller.user?.properties?["parentKakaoId"];
            if (userID != null) {
              return Text(
                userID,
                style: const TextStyle(
                  fontSize: 20,
                ),
              );
            } else {
              return const Text(
                "아이디",
                style: TextStyle(
                  fontSize: 20,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
