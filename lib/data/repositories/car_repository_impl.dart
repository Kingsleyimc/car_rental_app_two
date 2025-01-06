import 'package:car_rental_app_two/data/datasources/firebase_car_data_sources.dart';
import 'package:car_rental_app_two/data/model/car.dart';
import 'package:car_rental_app_two/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }

  Future<void> addCar(Car car) {
    return dataSource.addCar(car);
  }
}
