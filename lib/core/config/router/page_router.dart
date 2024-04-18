import 'package:can_frame_parser/features/can_parser/presentation/screens/mobile/screens/mobile_frame_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../features/can_parser/presentation/screen_controller.dart';
import '../../../features/can_parser/presentation/screens/mobile/mobile_wrapper.dart';
import '../../../features/can_parser/presentation/screens/mobile/screens/mobile_available_modules.dart';
import '../../../features/can_parser/presentation/screens/mobile/screens/mobile_details.dart';
import '../../../features/can_parser/presentation/screens/mobile/screens/mobile_home.dart';
import '../../../features/can_parser/presentation/screens/shared/coming_soon.dart';

enum RoutePath{
  screenController(path: "/"),

  ////////////////////////////////////
  mobileHome(path: "/mobile_home"),
  tabletHome(path: "/tablet_home"),
  desktopHome(path: "/desktop_home"),

  mobileAvailableModules(path: "mobile_available_modules"),
  tabletAvailableModules(path: "tablet_available_modules"),
  desktopAvailableModules(path: "desktop_available_modules"),

  mobileFrameData(path: "mobile_frame_data"),
  tabletFrameData(path: "tablet_frame_data"),
  desktopFrameData(path: "desktop_frame_data"),
  ////////////////////////////////////
  listMessagesMobile(path: "/list_messages_mobile"),
  listMessagesTablet(path: "/list_messages_tablet"),
  listMessagesDesktop(path: "/list_messages_desktop"),

  arbitrationIDsMobile(path: "/arbitration_IDs_mobile");
  ////////////////////////////////////

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
                    name: RoutePath.mobileHome.name ,
                    builder: (context, state) => const MobileHome(),
                    routes: [
                      // where you can go from home
                      GoRoute(
                        path: RoutePath.mobileAvailableModules.path,
                        name: RoutePath.mobileAvailableModules.name,
                        builder: (context, state){
                          return const MobileAvailableModules();
                        },
                        routes: [
                          GoRoute(
                            path: RoutePath.mobileFrameData.path,
                            name: RoutePath.mobileFrameData.name,
                            builder: (context, state){
                              return const MobileFrameData();
                            },
                          ),
                        ]
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

