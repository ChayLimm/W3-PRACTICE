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
  late bool isNotFound;
  
  ///
  ///Prepare render data
  ///
  
 @override
void initState() {
  super.initState();
  ///
  /// Compare and find the match ride
  /// 
  matchRide = RidesService.getRidesFor(widget.ridePref);
}

  void onFilterPressed(){
    print("Onfilter");
  }
  void onRidePredPressed(){
    print("open pref top modal");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            RidePrefBar(
              ridePref: widget.ridePref,
              onFilterPressed: onFilterPressed,
              onPressed: onRidePredPressed,
              ),
            SizedBox(height: BlaSpacings.xl,),
            /// if match, then show the list of matchRide
            if(!isNotFound)...[
              Expanded(
                child: ListView.builder(
                  itemCount: matchRide.length,
                  itemBuilder: (context, index) => RideCard(ride: matchRide[index]),
                ),
              )],
            // else its show not found
            if(isNotFound)...[
              Center(
                child: Text(
                  "No Ride are available", style: BlaTextStyles.body,
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}