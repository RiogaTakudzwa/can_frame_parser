import 'package:can_frame_parser/features/can_parser/presentation/screens/desktop/desktop_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../features/can_parser/presentation/screen_controller.dart';
import '../../../features/can_parser/presentation/screens/mobile/mobile_wrapper.dart';
import '../../../features/can_parser/presentation/screens/mobile/screens/mobile_details.dart';
import '../../../features/can_parser/presentation/screens/mobile/screens/mobile_home.dart';
import '../../../features/can_parser/presentation/screens/shared/coming_soon.dart';
import '../../../features/can_parser/presentation/screens/tablet/tablet_wrapper.dart';

enum RoutePath{
  root(path: "/"),

  screenController(path: "/"),

  mobileHome(path: "/mobile_home"),
  tabletHome(path: "/tablet_home"),
  desktopHome(path: "/desktop_home"),

  listMessagesMobile(path: "/list_messages_mobile"),
  listMessagesTablet(path: "/list_messages_tablet"),
  listMessagesDesktop(path: "/list_messages_desktop"),

  arbitrationIDsMobile(path: "/arbitration_IDs_mobile");

  const RoutePath({required this.path});
  final String path;
}

abstract class AppPageRouter{

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "shellHome");
  static final detailsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "shellDetails");

  static final router = GoRouter(
    initialLocation: RoutePath.screenController.path,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[

      // General navigation that isn't in a shell/has bottom navigation
      // Add any other route you want to go to directly
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: RoutePath.screenController.path,
        name: RoutePath.screenController.name,
        builder: (context, state) => ScreenController(key: state.pageKey),
        // routes: [
          // Check to see if this works
          // StatefulShellRoute.indexedStack(
          //   builder: (context, state, navigationShellMobile){
          //     return MobileWrapper(navigationShell: navigationShellMobile,);
          //   },
          //   branches: <StatefulShellBranch>[
          //     StatefulShellBranch(
          //         navigatorKey: homeNavigatorKey,
          //         routes: <RouteBase>[
          //           GoRoute(
          //               path: RoutePath.mobileHome.path,
          //               name: "MobileHome" ,
          //               builder: (context, state) => MobileHome(key: state.pageKey),
          //               routes: [
          //                 // where you can go from home
          //                 GoRoute(
          //                     path: "subHome",
          //                     name: "SubHome",
          //                     pageBuilder: (context, state){
          //                       return CustomTransitionPage(
          //                           child: const ComingSoon(), // the actual screen
          //                           transitionsBuilder: (context, animation, secondaryAnimation, child){
          //                             return FadeTransition(
          //                                 opacity: animation,
          //                                 child: child
          //                             );
          //                           }
          //                       );
          //                     }
          //                 ),
          //               ]
          //           ),
          //         ]
          //     ),
          //   ],
          // ),
        // ]
      ),

      // Mobile Routes
      StatefulShellRoute.indexedStack(
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state, navigationShellMobile){
            return MobileWrapper(navigationShell: navigationShellMobile,);
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
                navigatorKey: homeNavigatorKey,
                routes: <RouteBase>[
                  GoRoute(
                    path: RoutePath.mobileHome.path,
                    name: "MobileHome" ,
                    builder: (context, state) => MobileHome(key: state.pageKey),
                    routes: [
                      // where you can go from home
                      GoRoute(
                        path: "subHome",
                        name: "SubHome",
                        pageBuilder: (context, state){
                          return CustomTransitionPage(
                            child: const ComingSoon(), // the actual screen
                            transitionsBuilder: (context, animation, secondaryAnimation, child){
                              return FadeTransition(
                                opacity: animation,
                                child: child
                              );
                            }
                          );
                        }
                      ),
                    ]
                  ),
                ]
            ),

            StatefulShellBranch(
                navigatorKey: detailsNavigatorKey,
                routes: <RouteBase>[
                  GoRoute(
                    path: RoutePath.arbitrationIDsMobile.path,
                    name: RoutePath.arbitrationIDsMobile.name ,
                    builder: (context, state) => MobileDetails(key: state.pageKey),
                    routes: [
                      // where you can go from home
                      GoRoute(
                        path: "subDetails",
                        name: "subDetails",
                        pageBuilder: (context, state){
                          return CustomTransitionPage(
                            child: const ComingSoon(), // the actual screen
                            transitionsBuilder: (context, animation, secondaryAnimation, child){
                              return FadeTransition(
                                opacity: animation,
                                child: child
                              );
                            }
                          );
                        }
                      ),
                    ]
                  ),
                ]
            ),
          ],
      ),

      // Tablet Routes
      // Apply as above

      // Desktop Routes
      // Apply as above



    ]
  );

}

