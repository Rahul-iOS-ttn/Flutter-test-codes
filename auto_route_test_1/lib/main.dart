import 'package:flutter/material.dart';

import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/main_router.gr.dart';

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
