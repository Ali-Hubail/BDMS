import 'package:bdms/domain/blood_group.dart';
import 'package:flutter/material.dart';

class BloodGroupItem extends StatelessWidget {
  const BloodGroupItem({
    super.key,
    required this.bloodGroup,
    required this.onTap,
  });

  final BloodGroup bloodGroup;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: const Color(0xFFC62C2D),
      child: InkWell(
        onTap: onTap,
        child: Text(
          bgMap[bloodGroup]!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
