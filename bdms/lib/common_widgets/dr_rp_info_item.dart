import 'package:bdms/domain/blood_group_enum.dart';
import 'package:flutter/material.dart';

class DrRpInfoItem extends StatelessWidget {
  const DrRpInfoItem(
      {super.key,
      required this.name,
      required this.rowItem1,
      required this.rowItem2,
      required this.bloodGroup,
      required this.icon1,
      required this.icon2,
      required this.icon1OnTap,
      required this.icon2OnTap,
      this.onTap});

  final String name;
  final String rowItem1;
  final String rowItem2;
  final BloodGroup bloodGroup;
  final IconData icon1;
  final IconData icon2;
  final void Function() icon1OnTap;
  final void Function() icon2OnTap;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 370,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(50, 198, 44, 45),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 16,
            ),
            Image.asset(
              'assets/bdms.png',
              width: 76,
              height: 76,
            ),
            const SizedBox(
              width: 24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(rowItem1),
                Text(rowItem2),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  bgMap[bloodGroup]!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFFC62C2D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: icon1OnTap,
                      child: Icon(
                        icon1,
                        color: const Color.fromARGB(178, 198, 44, 45),
                        size: 28,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: icon2OnTap,
                      child: Icon(
                        icon2,
                        size: 28,
                        color: const Color.fromARGB(178, 198, 44, 45),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
