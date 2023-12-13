import 'package:flutter/material.dart';

class BloodStatInfoItem extends StatelessWidget {
  const BloodStatInfoItem({
    super.key,
    this.title,
    this.number,
  });
  final String? title;
  final String? number;
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
            title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            number.toString(),
            style: const TextStyle(fontSize: 20, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
