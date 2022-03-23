import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/main_router.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBarPage extends StatelessWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) => AppBar(
        title: const Text('Navigation'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        leading: const AutoBackButton(),
      ),
      backgroundColor: Colors.indigo,
      bottomNavigationBuilder: (context, tabsRouter) => SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
            selectedColor: Colors.amberAccent,
            icon: const Icon(
              Icons.post_add,
              size: 30,
            ),
            title: const Text('Posts'),
          ),
          SalomonBottomBarItem(
            selectedColor: Colors.blue[200],
            icon: const Icon(
              Icons.person,
              size: 30,
            ),
            title: const Text('Users'),
          ),
          SalomonBottomBarItem(
            selectedColor: Colors.pinkAccent[100],
            icon: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: const Text('Settings'),
          ),
        ],
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
      ),
      routes: const [
        PostsRouter(),
        UsersRouter(),
        SettingsRouter(),
      ],
    );
  }
}
