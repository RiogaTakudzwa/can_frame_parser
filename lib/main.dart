import 'package:can_frame_parser/features/can_parser/presentation/bloc/can_frames_bloc/can_frame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/router/page_router.dart';
import 'core/config/theme/app_theme.dart';
import 'features/can_parser/presentation/bloc/car_list_bloc/car_list_bloc.dart';
import 'injection_container.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<CanFrameBloc>()),
        BlocProvider(create: (_) => locator<CarListBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        routerConfig: AppPageRouter.router,
      ),
    );
  }
}