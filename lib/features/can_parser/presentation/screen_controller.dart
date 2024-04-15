import 'package:can_frame_parser/features/can_parser/presentation/screens/shared/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({super.key});

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {

  Future<bool> getScreenSize() async {
    await Future.delayed(const Duration(seconds: 3));
    print("Done with Splash");
    return true;
  }

  late Future<bool> navigateToHomeScreen;

  @override
  void initState() {
    super.initState();
    navigateToHomeScreen = getScreenSize();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return FutureBuilder(
          future: navigateToHomeScreen,
          builder: (context, snapshot){

            if(constraints.maxWidth > 1300){
              context.go('/desktop_home');
            } else if(constraints.maxWidth > 600 && constraints.maxWidth < 1300){
              context.go('/tablet_home');
            }else{
              print("Going to Mobile Home");
              context.go('/mobile_home');
            }

            return const SplashScreen();
          }
        );
      }
    );
  }
}

/// Maybe not the best way because of the dependency that the wrappers have on navigation shells
// class ScreenController extends StatelessWidget {
//   const ScreenController({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return LayoutBuilder(
//       builder: (context, constraints){
//         if(constraints.maxWidth > 1300){
//           return const DesktopWrapper();
//         } else if(constraints.maxWidth > 600 && constraints.maxWidth < 1300){
//           return const TabletWrapper();
//         }else{
//           return MobileWrapper(navigationShell: navigationShell);
//         }
//       },
//     );
//   }
// }


/// An idea using bloc for authentication and a controller to redirect to the right page
// class MyFirstPage extends StatelessWidget {
//   const MyFirstPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthenticationBloc, AuthenticationState>(
//       listener: (context, state) {
//         switch (state.status) {
//           case AuthenticationStatus.unauthenticated:
//             context.go('/login');
//             break;
//           case AuthenticationStatus.authenticated:
//             context.go('/home');
//             break;
//           case AuthenticationStatus.unknown:
//             break;
//         }
//       },
//       child: const SplashPage(),
//     );
//   }
// }