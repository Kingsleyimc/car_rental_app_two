import 'package:car_rental_app_two/data/model/car.dart';
import 'package:car_rental_app_two/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    //call fetch car function directly
    return await repository.fetchCars();
  }
}

//next is to create the data source
// inside the data siurce we are just goig to fetch, it's like making an API call, but like the previous ones we're going to use firebase and fetch data 