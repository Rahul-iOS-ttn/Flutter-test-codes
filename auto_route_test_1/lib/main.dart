import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/main_router.gr.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatefulWidget {
  AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _mainRouter = MainRouter();
  var _isFirstTime = true;

  // @override
  // void initState() {
  //   Future.delayed(Duration.zero).then((value) => {
  //     initDynamicLinks(context)
  //   });
  //   super.initState();
  // }
  @override
  void didChangeDependencies() {
    if(_isFirstTime) {
      initDynamicLinks(context);
      _isFirstTime = false;
    }
    
    super.didChangeDependencies();
  }

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


void initDynamicLinks(BuildContext context) async {
  FirebaseDynamicLinks.instance.onLink(
    onSuccess: (PendingDynamicLinkData? dynamicLinkData) async{
      final Uri? deeplink = dynamicLinkData?.link;
      if(deeplink!= null) {
       print("deeplink data " + deeplink.queryParameters.values.first);
       //AutoRouter.of(context).pushNamed(deeplink.queryParameters.values.first);
       Navigator.of(context).pushNamed(deeplink.queryParameters.values.first);
       print("Should have done the work");
      }
    },

    onError: (OnLinkErrorException e) async{
      print(e.message);
    }
  );
}