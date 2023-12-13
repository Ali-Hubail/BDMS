import 'package:flutter/material.dart';

class BloodType extends StatelessWidget {
  const BloodType({
    super.key,
    this.bloodType,
  });
  final String? bloodType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0, left: 16),
      child: Row(
        children: [
          const Text(
            '\u2022',
            style: TextStyle(fontSize: 32),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            bloodType!,
            style: const TextStyle(fontSize: 20),
          ),
          const Spacer(),
          const Text(
            '0',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
