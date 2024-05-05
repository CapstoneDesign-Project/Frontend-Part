import 'package:flutter/material.dart';
import 'package:una/widgets/TypeChildContainer.dart';

class ReserveContainer extends StatelessWidget {
  final String datetimeTxt;
  final String typeTxt;
  final String childName;

  const ReserveContainer({
    super.key,
    required this.datetimeTxt,
    required this.typeTxt,
    required this.childName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 217, 217, 217),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              datetimeTxt,
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const TypeChildContainer(text: '유형'),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  typeTxt,
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const TypeChildContainer(text: '자녀'),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  childName,
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
