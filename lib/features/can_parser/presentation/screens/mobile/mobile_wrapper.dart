import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../widgets/navigation_widgets/navigation_icons.dart';

class MobileWrapper extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MobileWrapper({
    super.key,
    required this.navigationShell
  });

  @override
  State<MobileWrapper> createState() => _MobileWrapperState();
}

class _MobileWrapperState extends State<MobileWrapper> {

  // void goToBranch(int index){
  //   print("index");
  //   print(index);
  //
  //   widget.navigationShell.goBranch(
  //     index,
  //     initialLocation: index == widget.navigationShell.currentIndex
  //   );
  //   // Try to remove this setState by moving to bloc
  //   if(mounted) setState(() {});
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: widget.navigationShell
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (index) {
          widget.navigationShell.goBranch(
            index,
            initialLocation: index == widget.navigationShell.currentIndex,
          );
          //if(mounted) setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'details',
          ),
        ],
      ),

      /// This implementation of bottom nav bar doesn't call the function to update the navigationShell child index
      // bottomNavigationBar: NavigationBarTheme(
      //   data: const NavigationBarThemeData(
      //       backgroundColor: Colors.white70
      //   ),
      //   child: Container(
      //     height: 70,
      //     width: MediaQuery.of(context).size.width,
      //     decoration: const BoxDecoration(
      //         borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(20),
      //             topRight: Radius.circular(20)
      //         )
      //     ),
      //     child: ClipRRect(
      //       borderRadius: const BorderRadius.only(
      //           topLeft: Radius.circular(20),
      //           topRight: Radius.circular(20)
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           // TODO: Move the index into bloc state and emit changes from there
      //           // // Home Icon
      //           // NavigationIcon(
      //           //   function: ()=> BlocProvider.of<NavigationBloc>(context).add(UpdateNavigationIndexEvent(index: 0)),
      //           //   size: 20,
      //           //   text: "Home",
      //           //   widgetColour: state.currentScreenIndex == 0 ?
      //           //     ColourScheme.navigationIconActiveColour :
      //           //     ColourScheme.navigationIconDeselectedColour,
      //           //   widgetIcon: const Icon(Icons.home_filled),
      //           // ),
      //           //
      //           // // Home Icon
      //           // NavigationIcon(
      //           //   function: ()=> BlocProvider.of<NavigationBloc>(context).add(UpdateNavigationIndexEvent(index: 1)),
      //           //   size: 20,
      //           //   text: "Home",
      //           //   widgetColour: state.currentScreenIndex == 0 ?
      //           //     ColourScheme.navigationIconActiveColour :
      //           //     ColourScheme.navigationIconDeselectedColour,
      //           //   widgetIcon: const Icon(Icons.favorite_outline_rounded),
      //           // ),
      //
      //           // Home Icon
      //
      //           /// For now will just keep it here
      //           NavigationIcon(
      //             function: (){
      //               goToBranch(0);
      //             },
      //             size: 20,
      //             text: "Home",
      //             widgetColour: Colors.black,
      //             widgetIcon: const Icon(Icons.home),
      //           ),
      //
      //           GestureDetector(
      //             onTap: (){
      //               print("Function Called");
      //               goToBranch(0);
      //             },
      //             child: NavigationIcon(
      //               function: (){
      //                 print("Function Called");
      //                 goToBranch(0);
      //               },
      //               size: 20,
      //               text: "Details",
      //               widgetColour: Colors.black,
      //               widgetIcon: const Icon(Icons.details),
      //             ),
      //           ),
      //
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

