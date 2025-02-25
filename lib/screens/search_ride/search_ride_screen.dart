import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/screens/search_ride/widgets/ride_card.dart';
import 'package:week_3_blabla_project/screens/search_ride/widgets/ride_pref_tile.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class SearchRideScreen extends StatefulWidget {
  final RidePref ridePref;
  const SearchRideScreen({super.key,required this.ridePref});

  @override
  State<SearchRideScreen> createState() => _SearchRideScreenState();
}

class _SearchRideScreenState extends State<SearchRideScreen> {
  
  late List<Ride> matchRide;
  ///
  ///Prepare render data
  ///
  
 @override
void initState() {
  super.initState();
  ///
  /// Compare and find the match ride
  /// 
  matchRide = RidesService.availableRides
      .where((ride) =>
          ride.departureLocation.name == widget.ridePref.departure.name &&
          ride.arrivalLocation.name == widget.ridePref.arrival.name &&
          ride.departureDate.day == widget.ridePref.departureDate.day &&
          ride.departureDate.month == widget.ridePref.departureDate.month &&
          ride.departureDate.year == widget.ridePref.departureDate.year
          ) // Ensure full date match
      .toList();  
}


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            RidePrefTile(ridePref: widget.ridePref),
            SizedBox(height: BlaSpacings.xl,),
            Expanded(
              child: ListView.builder(
                itemCount: matchRide.length,
                itemBuilder: (context, index) => RideCard(ride: matchRide[index]),
              ),
            )
          ],
        ),
      ),
    );
  }
}