import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:una/UserController.dart';

class ParentsName extends StatelessWidget {
  //final String text;

  const ParentsName({super.key
      //required this.text,
      });

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(
    //     color: const Color.fromARGB(255, 217, 217, 217),
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    //     child: Row(
    //       children: [
    //         Text(
    //           text,
    //           style: const TextStyle(
    //             fontSize: 20,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 217, 217, 217),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Consumer<UserController>(
          builder: (context, controller, child) {
            // 사용자의 닉네임 가져오기
            final String? name = controller.user?.properties?["parentName"];
            if (name != null) {
              return Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              );
            } else {
              return const Text(
                "이름",
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
