import 'package:car_rental_app_two/data/model/car.dart';

abstract class CarState {}

class CarsLoading extends CarState {}

class CarsLoaded extends CarState {
  final List<Car> cars;
  CarsLoaded(this.cars);
}

class CarsError extends CarState {
  final String message;
  CarsError(this.message);
}
