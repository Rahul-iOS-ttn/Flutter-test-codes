import 'package:auto_route/auto_route.dart';

import '../bottombar_page.dart';
import '../posts/posts_page.dart';
import '../posts/single_post_page.dart';
import '../settings/settings_page.dart';
import '../users/user_profile_page.dart';
import '../users/users_page.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(
    path: '/',
    page: BottomBarPage,
    children: [
      AutoRoute(
        path: 'posts',
        name: 'PostsRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: PostsPage),
          AutoRoute(path: ':postId', page: SinglePostPage),
        ],
      ),
      AutoRoute(
        path: 'users',
        name: 'UsersRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: UsersPage),
          AutoRoute(path: ':userId', page: UserProfilePage),
        ],
      ),
      AutoRoute(
        path: 'settings',
        name: 'SettingsRouter',
        page: SettingsPage,
      )
    ],
  )
], replaceInRouteName: 'Page,Route')
class $MainRouter {}
