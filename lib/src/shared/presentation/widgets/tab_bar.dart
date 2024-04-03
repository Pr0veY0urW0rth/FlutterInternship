import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTabBar extends StatefulWidget {
  const AppTabBar({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.child.currentIndex,
        onTap: (index) {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: const Icon(Icons.list_alt_rounded),
            label: 'Список',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'Найстройки',
          ),
        ],
      ),
    );
  }
}
