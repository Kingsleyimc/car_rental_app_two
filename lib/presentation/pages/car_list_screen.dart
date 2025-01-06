import 'package:car_rental_app_two/data/model/car.dart';
import 'package:car_rental_app_two/presentation/bloc/car_bloc.dart';
import 'package:car_rental_app_two/presentation/bloc/car_state.dart';
import 'package:car_rental_app_two/presentation/widgets/car_card.dart';
import 'package:car_rental_app_two/data/datasources/firebase_car_data_sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  final FirebaseCarDataSource carDataSource;

  CarListScreen({required this.carDataSource});

  Future<void> addCar(BuildContext context) async {
    final newCar = Car(
      model: 'New Model',
      distance: 0.0,
      fuelCapacity: 60.0,
      pricePerHour: 30.0,
    );

    try {
      await carDataSource.addCar(newCar);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Car added successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add car: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Your Car'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            if (state is CarsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CarsLoaded) {
              return ListView.builder(
                itemCount: state.cars.length,
                itemBuilder: (context, index) {
                  return CarCard(car: state.cars[index]);
                },
              );
            } else if (state is CarsError) {
              return Center(
                child: Text('error : ${state.message}'),
              );
            }
            return Container();
          },
        ));
  } 
}
