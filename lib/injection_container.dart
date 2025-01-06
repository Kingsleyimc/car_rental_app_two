import 'package:car_rental_app_two/data/datasources/firebase_car_data_sources.dart';
import 'package:car_rental_app_two/data/repositories/car_repository_impl.dart';
import 'package:car_rental_app_two/domain/repositories/car_repository.dart';
import 'package:car_rental_app_two/domain/usecases/get_cars.dart';
import 'package:car_rental_app_two/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    // we are going to use getIt to initialise and the first thing we need to initialize is firebase
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(
      () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>())
      );
      
      getIt.registerLazySingleton<CarRepository>(
      () => CarRepositoryImpl(getIt<FirebaseCarDataSource>())
      );

      getIt.registerLazySingleton<GetCars>(
      () => GetCars(getIt<CarRepository>())
      );

      getIt.registerFactory(
      () => CarBloc(getCars: getIt<GetCars>())
      );

  } catch (e) {
    throw e;
  }
}
