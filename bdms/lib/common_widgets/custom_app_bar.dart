import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    super.key,
    required this.title,
    this.backButton = false,
  });

  final String title;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 198, 44, 45),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: CustomAppBarContent(
            title: title, backButton: backButton, preferredSize: preferredSize),
      ),
    );
  }

  @override
  Widget get child => CustomAppBarContent(
        title: title,
        backButton: backButton,
        preferredSize: preferredSize,
      );

  @override
  Size get preferredSize => const Size(double.infinity, 128);
}

class CustomAppBarContent extends StatelessWidget {
  const CustomAppBarContent({
    super.key,
    required this.title,
    required this.backButton,
    required this.preferredSize,
  });

  final String title;
  final bool backButton;
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 128,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (backButton)
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
