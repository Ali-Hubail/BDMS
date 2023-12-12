import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.managerView = false,
  });

  final bool managerView;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 96,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 32,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBottomNavigationBarItem(
              onTap: () {
                // Navigate to home page
                setState(() {
                  selectedIndex = 0;
                });
              },
              itemTitle: 'Home',
              icon: Icons.home,
              isSelected: selectedIndex == 0,
            ),
            if (widget.managerView)
              CustomBottomNavigationBarItem(
                onTap: () {
                  // Navigate to manage page
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                itemTitle: 'Manage',
                icon: Icons.shield,
                isSelected: selectedIndex == 1,
              ),
            CustomBottomNavigationBarItem(
              onTap: () {
                // Navigate to reports/history page
                setState(() {
                  selectedIndex = 2;
                });
              },
              itemTitle: widget.managerView ? 'Reports' : 'History',
              icon: Icons.query_stats,
              isSelected: selectedIndex == 2,
            ),
            CustomBottomNavigationBarItem(
              onTap: () {
                // Navigate to settings page
                setState(() {
                  selectedIndex = 3;
                });
              },
              itemTitle: 'Settings',
              icon: Icons.settings,
              isSelected: selectedIndex == 3,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    super.key,
    required this.onTap,
    required this.itemTitle,
    required this.icon,
    required this.isSelected,
  });

  final void Function() onTap;
  final String itemTitle;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected
                ? const Color.fromARGB(255, 198, 44, 45)
                : Colors.black.withOpacity(0.5),
          ),
          Text(
            itemTitle,
            style: TextStyle(
              color: isSelected
                  ? const Color.fromARGB(255, 198, 44, 45)
                  : Colors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
