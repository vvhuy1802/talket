import 'package:auto_route/annotations.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

import '../chat/chat_screen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  late final List<Widget> _tabItems = [
    const Center(child: Text("Contacts")),
    const ChatScreen(),
    const Center(child: Text("Settings")),
  ];

  final pageController = PageController(initialPage: 1);

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: _tabItems,
        ),
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          pageController.jumpToPage(index);
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.perm_contact_cal_rounded),
            title: Text('Contacts'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chats'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
