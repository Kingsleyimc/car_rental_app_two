// inside the data siurce we are just goig to fetch, it's like making an API call, but like the previous ones we're going to use firebase and fetch data
import 'package:car_rental_app_two/data/model/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDataSource {
  final FirebaseFirestore firestore;

  FirebaseCarDataSource({required this.firestore});

  Future<List<Car>> getCars() async {
    var snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }

  Future<void> addCar(Car car) async {
    try {
      await firestore.collection('cars').add({
        'model': car.model,
        'distance': car.distance,
        'fuelCapacity': car.fuelCapacity,
        'pricePerHour': car.pricePerHour,
      });
      print('Car added successfully!');
    } catch (e) {
      print('Failed to add car: $e');
      throw e;
    }
  }
}