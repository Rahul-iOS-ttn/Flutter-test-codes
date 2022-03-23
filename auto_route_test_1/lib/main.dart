import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/data/app_data.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/posts/posts_page.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/main_router.gr.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/settings/settings_page.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/users/users_page.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  final _mainRouter = MainRouter();

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Bottom Nav Bar with Nested Routing',
    //   home: PostsPage(),
    // );
    return MaterialApp.router(
      routeInformationParser: _mainRouter.defaultRouteParser(),
      routerDelegate: _mainRouter.delegate(),
      title: 'Navigation',
      debugShowCheckedModeBanner: false,
    );
  }
}
