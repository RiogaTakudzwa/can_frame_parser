import 'package:can_frame_parser/features/can_parser/presentation/bloc/car_list_bloc/car_list_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/can_parser/data/data_source/local/local_data_source.dart';
import 'features/can_parser/data/repository/can_frame_parser_repository_implementation.dart';
import 'features/can_parser/domain/repositories/can_frame_parser_repository.dart';
import 'features/can_parser/domain/usecases/get_list_of_available_cars.dart';
import 'features/can_parser/domain/usecases/get_parsing_tables.dart';
import 'features/can_parser/domain/usecases/get_vehicle_capture_data.dart';
import 'features/can_parser/presentation/bloc/can_frames_bloc/can_frame_bloc.dart';
import 'features/can_parser/presentation/bloc/pasring_table/parsing_table_bloc.dart';

final locator = GetIt.instance;

void setupLocator(){
  // blocs
  locator.registerFactory(() => CanFrameBloc(
      locator<GetVehicleCaptureData>(),
  ));

  locator.registerFactory(() => CarListBloc(
      locator<GetListOfAvailableCars>()
  ));

  locator.registerFactory(() => ParsingTableBloc(
      locator<GetListOfParsingTables>()
  ));

  // use cases
  locator.registerLazySingleton(() => GetVehicleCaptureData(locator()));
  locator.registerLazySingleton(() => GetListOfAvailableCars(locator()));
  locator.registerLazySingleton(() => GetListOfParsingTables(locator()));

  // repositories
  locator.registerLazySingleton<CanFrameParserRepository>(
    () => CanFrameParserRepositoryImplementation(
      canFrameLocalDataSource: locator()
    ),
  );

  // data sources
  locator.registerLazySingleton<CanFrameLocalDataSource>(
    () => CanFrameLocalDataSourceImplementation(),
  );
}