import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/screens/location_picker/widgets/location_tile.dart';
import 'package:week_3_blabla_project/screens/location_picker/widgets/search_bar.dart';
import 'package:week_3_blabla_project/service/locations_service.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class LocationPickerScreen extends StatefulWidget {
  //Function to modify the parent locotion
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  List<Location>? matchLocationList;
  
  // ----------------------------------
  // Handle events
  // ----------------------------------

  //handle when user typing
  void onSearchChange(String userInput){
    setState(() {
       matchLocationList = matchLocation(userInput);
    });
  }
  //hanld when use select one of the listed location while searching
  void onSelectLocation(Location location){
    Navigator.pop(context,location);
  }
  
  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  List<Location> matchLocation(String userInput) {
    return LocationsService.availableLocations.where((item) {
      return item.name.toLowerCase().contains(userInput.toLowerCase());
    }).toList();
  } 
  
  
  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: BlaColors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            BlaSearchBar(onChange: onSearchChange),
            const SizedBox(height: BlaSpacings.m,),
            if(matchLocationList!=null) 
              Expanded(
                child: ListView.builder(
                  itemCount: matchLocationList!.length,
                  itemBuilder: (context, index) => LocationTile(location: matchLocationList![index], onPressed: onSelectLocation),
                ),
              )
          ],
        )
      ),
    );
  }
}




