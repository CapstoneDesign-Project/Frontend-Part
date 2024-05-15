import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:una/UserController.dart';

class ParentsPhone extends StatelessWidget {
  const ParentsPhone({super.key});

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
            final String? phone =
                controller.user?.properties?["parentPhoneNumber"];
            if (phone != null) {
              return Text(
                phone,
                style: const TextStyle(
                  fontSize: 20,
                ),
              );
            } else {
              return const Text(
                "전화번호",
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
