import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/presentation/authentication/login_screen.dart';
import 'package:bdms/presentation/dr_rp_history/dr_rp_history.dart';
import 'package:bdms/presentation/dr_rp_home/dr_rp_home.dart';
import 'package:bdms/presentation/dr_rp_settings/dr_rp_settings.dart';
import 'package:bdms/presentation/mgr_home/mgr_home.dart';
import 'package:bdms/presentation/mgr_manage/mgr_manage.dart';
import 'package:bdms/presentation/mgr_reports/mgr_reports.dart';
import 'package:bdms/presentation/mgr_settings/mgr_settings.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.managerView = false,
    required this.index,
  });

  final bool managerView;
  final int index;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index;
  }

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
                if (widget.managerView) {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MgrHomeScreen(),
                  ));
                } else {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DrRpHomeScreen(),
                  ));
                }
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
                  Navigator.of(context).pop();
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MgrManageScreen(),
                    ));
                  });

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
                if (AuthenticationRepository.authInstance.signedInUser ==
                    null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                  return;
                }
                if (!widget.managerView) {
                  Navigator.of(context).pop();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DrRpHistoryScreen(),
                    ),
                  );
                } else {
                  // Navigate to manager history page
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MgrReportsScreen(),
                    ),
                  );
                }
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
                if (!widget.managerView) {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DrRpSettingsScreen(),
                    ),
                  );
                } else {
                  // Navigate to manager settings page
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MgrSettingsScreen(),
                  ));
                }
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
