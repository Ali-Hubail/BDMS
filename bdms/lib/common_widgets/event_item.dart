import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EventItem extends StatelessWidget {
  EventItem(
      {super.key,
      required this.day,
      required this.month,
      required this.title,
      required this.description});
  int? day;
  String? month;
  String? title;
  String? description;
  String? bulletPoint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const SizedBox(
            height: 12,
          ),
          const Text(
            "\u2022 ",
            style:
                TextStyle(fontSize: 36, color: Color.fromARGB(255, 9, 68, 170)),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Align children to the start of the column
            children: [
              Text(
                month!,
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                day.toString(),
                style: const TextStyle(fontSize: 32),
              ),
            ],
          ),
          const SizedBox(
            width: 72,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment
                .center, // Center align the children horizontally
            children: [
              Text(
                title!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                description!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
