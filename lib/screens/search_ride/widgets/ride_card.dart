import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';

class RideCard extends StatelessWidget {
  final Ride ride;
  const RideCard({super.key, required this.ride});

  ///
  ///Testing card
  ///

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(ride.arrivalDateTime.toString()),
          Text(ride.departureLocation.name),
          Text(ride.departureDate.toString()),
          Text(ride.arrivalLocation.name),
          Text(ride.arrivalDateTime.toString()),
          Text(ride.driver.firstName),
          Text(ride.passengers.toString())
        ],
      ),
    );
  }
}