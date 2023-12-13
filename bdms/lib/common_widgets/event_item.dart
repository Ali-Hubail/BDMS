import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EventItem extends StatelessWidget {
  EventItem(
      {super.key,
      required this.day,
      required this.month,
      required this.title,
      required this.description,
      this.states});
  int? day;
  String? month;
  String? title;
  String? description;
  String? bulletPoint;
  final String? states;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text(
            "\u2022 ",
            style:
                TextStyle(fontSize: 24, color: Color.fromARGB(255, 9, 68, 170)),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
            width: 56,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
          const Spacer(),
          Expanded(
            child: Center(
              child: Text(
                states ?? " ",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
