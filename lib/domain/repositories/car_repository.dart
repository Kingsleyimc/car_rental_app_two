import 'package:car_rental_app_two/data/model/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}

//CarRepository here is going to be implemented in the repository file in the data folder
//in the usecase we are going to get cars
